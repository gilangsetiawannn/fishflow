import 'package:flutter/material.dart';

class AlamatPengirimanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alamat Pengiriman"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman Checkout
          },
          child: Text("Selesai"),
        ),
      ),
    );
  }
}
