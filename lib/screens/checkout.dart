import 'package:fishflow/screens/keranjang_model.dart';
import 'package:fishflow/screens/promo_selection_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'alamat_pengiriman.dart';
import 'opsi_pengiriman.dart';
import 'pesanan_diterima.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedShippingOption = 'Standar';
  String _selectedPaymentMethod = 'Kartu Debit';
  String _selectedPromoCode = '';
  String _address = 'Jalan Sei Wain No. 00, RT. 90, Karang Joang, Kota Balikpapan, ID 76100';
  String _recipientName = 'Amay';
  String _recipientPhone = '(\u002B62) 812-0000-0000';
  double _discount = 0.0;

  void _updateAddress(String newAddress, String newName, String newPhone) {
    setState(() {
      _address = newAddress;
      _recipientName = newName;
      _recipientPhone = newPhone;
    });
  }

  void _updateShippingOption(String newOption) {
    setState(() {
      _selectedShippingOption = newOption;
    });
  }

  void _applyPromoCode(String promoCode) {
    setState(() {
      _selectedPromoCode = promoCode;
      _discount = _calculateDiscount(promoCode);
    });
  }

  double _calculateDiscount(String promoCode) {
    switch (promoCode) {
      case '25k off food.':
        return 25000.0;
      case '20k off food.':
        return 20000.0;
      case '15k off food.':
        return 15000.0;
      case '75k off food.':
        return 75000.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    double getTotalPrice() {
      double total = 0;
      cart.items.forEach((product, quantity) {
        total += double.parse(product.price.replaceAll('Rp ', '').replaceAll('.', '')) * quantity;
      });
      return total;
    }

    double getDiscountedPrice(double totalPrice) {
      return totalPrice - _discount;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat Pengiriman',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    title: Text(_recipientName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_recipientPhone),
                        Text(_address),
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlamatPengirimanPage(
                              initialAddress: _address,
                              initialName: _recipientName,
                              initialPhone: _recipientPhone,
                            ),
                          ),
                        );
                        if (result != null) {
                          final updatedData = result as Map<String, String>;
                          _updateAddress(
                            updatedData['address'] ?? _address,
                            updatedData['name'] ?? _recipientName,
                            updatedData['phone'] ?? _recipientPhone,
                          );
                        }
                      },
                      child: Text("Ubah"),
                    ),
                  ),
                  Divider(),
                  Text(
                    'Opsi Pengiriman',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    title: Text(_selectedShippingOption),
                    subtitle: Text('Dikirim antara 9-12 Desember'),
                    trailing: TextButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpsiPengiriman(initialOption: _selectedShippingOption),
                          ),
                        );
                        if (result != null) {
                          _updateShippingOption(result);
                        }
                      },
                      child: Text("Ubah"),
                    ),
                  ),
                  Divider(),
                  Text(
                    'Metode Pembayaran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    title: Text(_selectedPaymentMethod),
                    trailing: PopupMenuButton<String>(
                      onSelected: (String value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return {'Kartu Debit', 'COD', 'Transfer Bank'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  Divider(),
                  Text(
                    'Kode Promo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    title: Text(_selectedPromoCode.isEmpty ? 'Pilih Kode Promo' : _selectedPromoCode),
                    trailing: TextButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PromoCodeSelectionPage()),
                        );
                        if (result != null) {
                          _applyPromoCode(result);
                        }
                      },
                      child: Text("Pilih"),
                    ),
                  ),
                  Divider(),
                  Text(
                    'Total Produk: ${cart.items.length}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    'Subtotal Produk: Rp ${getTotalPrice().toStringAsFixed(0)}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    'Diskon: Rp $_discount',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  Text(
                    'Biaya Layanan: Rp 1.500',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    'Biaya Pengiriman: Rp 10.500',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total Pembayaran: Rp ${(getDiscountedPrice(getTotalPrice()) + 1500 + 10500).toStringAsFixed(0)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PesananDiterima()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Bayar Sekarang',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
