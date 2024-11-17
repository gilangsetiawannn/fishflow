import 'package:flutter/material.dart';
import '../product_model.dart'; // Import model Product

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            const SizedBox(height: 10),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(product.description),
            const SizedBox(height: 10),
            Text(
              product.price,
              style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 20),
            // Menambahkan informasi tentang ketersediaan pengiriman (logistik)
            _buildLogisticsInfo(product.isPickUpAvailable),
            const SizedBox(height: 20),
            // Spacer to push the button down
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Fungsi untuk menambahkan produk ke keranjang
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Produk berhasil ditambahkan ke keranjang!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900, // Latar belakang biru tua
                  foregroundColor: Colors.white, // Teks berwarna putih
                ),
                child: const Text("Masukkan Keranjang"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan status logistik
  Widget _buildLogisticsInfo(bool isAvailable) {
    return Row(
      children: [
        Icon(
          Icons.local_shipping, // Ikon truk logistik
          color: isAvailable ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 5),
        Text(
          isAvailable ? 'Tersedia' : 'Tidak Tersedia',
          style: TextStyle(
            color: isAvailable ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
