import 'package:flutter/material.dart';

class DetailNotifikasiPenjualPage extends StatelessWidget {
  final Map<String, String> notifikasi;

  DetailNotifikasiPenjualPage({required this.notifikasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notifikasi['title']!),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailItem(
              title: 'Nama Penerima',
              value: 'Amay',
            ),
            DetailItem(
              title: 'No. Telepon',
              value: '(\u002B62) 812 0000 0000',
            ),
            DetailItem(
              title: 'Alamat',
              value: 'Jalan Sei Wain No.00, RT.00, Karang Joang, Kota Balikpapan, ID 76100',
            ),
            SizedBox(height: 8.0),
            DetailItem(
              title: 'Pengiriman',
              value: 'Standar',
            ),
            DetailItem(
              title: 'Estimasi',
              value: '9-12 Des, Rp 10.500',
            ),
            SizedBox(height: 8.0),
            DetailItem(
              title: 'Metode Pembayaran',
              value: 'Kartu Debit (4321 **** **** 1142)',
            ),
            SizedBox(height: 8.0),
            DetailItem(
              title: 'Total Produk',
              value: '5',
            ),
            DetailItem(
              title: 'Subtotal Produk',
              value: 'Rp 544.000',
            ),
            DetailItem(
              title: 'Biaya Layanan',
              value: 'Rp 1.500',
            ),
            DetailItem(
              title: 'Biaya Pengiriman',
              value: 'Rp 10.500',
            ),
            DetailItem(
              title: 'Total Pembayaran',
              value: 'Rp 556.000',
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true); // Mengirim nilai kembali ke halaman notifikasi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Konfirmasi Pesanan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final String value;

  DetailItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
