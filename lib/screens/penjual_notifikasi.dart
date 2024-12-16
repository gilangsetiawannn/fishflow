import 'package:flutter/material.dart';
import 'detail_notifikasi_penjual.dart'; // Import halaman detail notifikasi penjual

class PenjualNotifikasiPage extends StatefulWidget {
  @override
  _PenjualNotifikasiPageState createState() => _PenjualNotifikasiPageState();
}

class _PenjualNotifikasiPageState extends State<PenjualNotifikasiPage> {
  final List<Map<String, String>> _notifikasiList = [
    {'title': 'Pesanan Baru', 'detail': 'Pesanan baru dari pelanggan A', 'tanggal': '2023-12-01'},
    {'title': 'Pembayaran Diterima', 'detail': 'Pembayaran untuk pesanan B telah diterima', 'tanggal': '2023-12-02'},
    {'title': 'Pesanan Dibatalkan', 'detail': 'Pesanan C telah dibatalkan oleh pelanggan', 'tanggal': '2023-12-03'},
    {'title': 'Pengiriman Selesai', 'detail': 'Pesanan D telah dikirimkan dan diterima', 'tanggal': '2023-12-04'},
  ];

  void _navigateToDetail(BuildContext context, Map<String, String> notifikasi) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailNotifikasiPenjualPage(notifikasi: notifikasi)),
    );

    if (result == true) {
      setState(() {
        _notifikasiList.remove(notifikasi); // Hapus notifikasi setelah dikonfirmasi
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi Penjual', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: _notifikasiList.length,
        itemBuilder: (context, index) {
          final notifikasi = _notifikasiList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  notifikasi['title']![0],
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(notifikasi['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Tanggal: ${notifikasi['tanggal']}'),
              onTap: () => _navigateToDetail(context, notifikasi),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/penjualHome');
          } else if (index == 1) {
            // Tetap di halaman Notifikasi
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/produk');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/addProduct');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/penjualProfile');
          }
        },
      ),
    );
  }
}
