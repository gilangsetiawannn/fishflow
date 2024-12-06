import 'package:flutter/material.dart';

class OpsiPengiriman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opsi Pengiriman"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke Checkout
              },
              child: Text("Selesai"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Pilih opsi pengiriman (aksi tambahan dapat ditambahkan di sini)
              },
              child: Text("Pilih Opsi Pengiriman"),
            ),
          ],
        ),
      ),
    );
  }
}
