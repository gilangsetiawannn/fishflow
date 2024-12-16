import 'package:fishflow/screens/keranjang_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  void _addToCart(BuildContext context) {
    Provider.of<CartModel>(context, listen: false).add(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} berhasil ditambahkan ke keranjang!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.price,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.store, color: Colors.blue.shade900),
                const SizedBox(width: 8),
                Text(
                  'Toko: ${product.storeName}',
                  style: TextStyle(fontSize: 16, color: Colors.blue.shade900),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.local_shipping, color: const Color.fromARGB(255, 13, 71, 161)),
                const SizedBox(width: 8),
                Text(
                  'Distributor: ${product.distributor}',
                  style: TextStyle(fontSize: 16, color:  const Color.fromARGB(255, 13, 71, 161)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue.shade900),
                        const SizedBox(width: 8),
                        Text(
                          'Ambil di Tempat:',
                          style: TextStyle(fontSize: 16, color: Colors.blue.shade900),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.local_shipping, color: Colors.blue.shade900),
                        const SizedBox(width: 8),
                        Text(
                          'Pengantaran:',
                          style: TextStyle(fontSize: 16, color: Colors.blue.shade900),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Tersedia',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tersedia',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, color: Colors.blue.shade900, size: 20),
                  const SizedBox(width: 8),
                  Text('Batas Pembelian: ${product.purchaseLimit}', style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () => _addToCart(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text('Tambahkan ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
