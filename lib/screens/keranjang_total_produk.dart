import 'package:fishflow/product_model.dart';
import 'package:fishflow/screens/keranjang_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checkout.dart';

class KeranjangTotalProduk extends StatelessWidget {
  const KeranjangTotalProduk({super.key});

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

    @override
    Widget buildCartItem(Product product, int quantity) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(product.image, fit: BoxFit.cover),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Rp ${product.price}',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Jumlah: $quantity',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).decrement(product);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).increment(product);
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).remove(product);
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product items
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cart.totalItems,
                itemBuilder: (context, index) {
                  final product = cart.items.keys.elementAt(index);
                  final quantity = cart.items[product]!;
                  return buildCartItem(product, quantity);
                },
              ),
              Divider(),
              // Summary details
              Text(
                'Total Produk: ${cart.items.length}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'Subtotal Produk: Rp ${getTotalPrice().toStringAsFixed(0)}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'Biaya Layanan: Rp 1.500',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'Biaya Pengiriman: Rp 10.500',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Total Pembayaran: Rp ${(getTotalPrice() + 1500 + 10500).toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Buat Pesanan',
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
