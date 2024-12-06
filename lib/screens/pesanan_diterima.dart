import 'package:flutter/material.dart';

class PesananDiterima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan Diterima"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
          child: Text("Halaman Utama"),
        ),
      ),
    );
  }
}
