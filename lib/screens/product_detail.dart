import 'package:flutter/material.dart';
import 'product_detail_penjual.dart'; // Import halaman detail produk penjual

class ProdukPage extends StatefulWidget {
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final List<Map<String, String>> _produkList = [
    {'nama': 'Ikan Tuna', 'tanggal': '2023-12-01', 'harga': 'Rp 50.000', 'deskripsi': 'Deskripsi Ikan Tuna', 'pengiriman': 'Ya'},
    {'nama': 'Ikan Nila', 'tanggal': '2023-12-02', 'harga': 'Rp 40.000', 'deskripsi': 'Deskripsi Ikan Nila', 'pengiriman': 'Tidak'},
    {'nama': 'Ikan Patin', 'tanggal': '2023-12-03', 'harga': 'Rp 45.000', 'deskripsi': 'Deskripsi Ikan Patin', 'pengiriman': 'Ya'},
    {'nama': 'Ikan Bandeng Laut', 'tanggal': '2023-12-04', 'harga': 'Rp 55.000', 'deskripsi': 'Deskripsi Ikan Bandeng Laut', 'pengiriman': 'Tidak'},
  ];

  void _navigateToDetail(Map<String, String> product) async {
    final updatedProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetail(product: product)),
    );

    if (updatedProduct != null) {
      setState(() {
        int index = _produkList.indexOf(product);
        _produkList[index] = updatedProduct;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: _produkList.length,
        itemBuilder: (context, index) {
          final produk = _produkList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  produk['nama']![0],
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(produk['nama']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Tanggal Input: ${produk['tanggal']}'),
              trailing: Text('Pengiriman: ${produk['pengiriman']}'),
              onTap: () => _navigateToDetail(produk),
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
        currentIndex: 2,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/penjualHome');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/penjualNotifikasi');
          } else if (index == 2) {
            // Tetap di halaman Produk
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
