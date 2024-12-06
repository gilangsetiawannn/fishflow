import 'package:flutter/material.dart';

class NotifikasiKonfirmasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Notifikasi",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.grey.shade300, // Placeholder for image
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "Ikan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildDetailBox(
              icon: Icons.location_on,
              title: "Alamat Pengiriman",
              content: "Alamat",
            ),
            SizedBox(height: 16),
            _buildDetailBox(
              icon: Icons.local_shipping,
              title: "Pengiriman",
              content: "Standar\nDikirim hari, Senin 20\nRp",
            ),
            SizedBox(height: 16),
            _buildDetailBox(
              icon: Icons.payment,
              title: "Metode Pembayaran",
              content: "Kartu Debit\n4321 **** **** **42",
            ),
            SizedBox(height: 16),
            _buildTotalSection(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi konfirmasi di sini
              },
              child: Text("Konfirmasi"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                minimumSize: Size(double.infinity, 48), // Full-width button
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailBox({required IconData icon, required String title, required String content}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildTotalRow("Ikan", "Rp"),
          SizedBox(height: 8),
          _buildTotalRow("Ikan", "Rp"),
          SizedBox(height: 8),
          _buildTotalRow("Ongkir", "Rp"),
          Divider(color: Colors.black),
          _buildTotalRow("Total", "Rp", isBold: true),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
