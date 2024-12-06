import 'package:flutter/material.dart';
import 'alamat_pengiriman.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlamatPengirimanPage()),
            );
          },
          child: Text("Alamat Pengiriman"),
        ),
      ),
    );
  }
}
