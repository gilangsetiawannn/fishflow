import 'package:flutter/material.dart';
import 'add_product.dart';

class PenjualHomePage extends StatefulWidget {
  @override
  _PenjualHomePageState createState() => _PenjualHomePageState();
}

class _PenjualHomePageState extends State<PenjualHomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/penjualHome'); // Navigasi ke halaman PenjualHomePage
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/penjualNotifikasi'); // Navigasi ke halaman Notifikasi Penjual
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/produk'); // Navigasi ke halaman ProdukPage
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/addProduct');
    } else if (index == 4) {
      Navigator.pushReplacementNamed(context, '/penjualProfile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjual', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(child: Text('Main Image', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Best Seller', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FishCard('Ikan Tuna', Colors.blue),
                FishCard('Ikan Nila', Colors.red),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Favorite', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FishCard('Ikan Patin', Colors.green),
                FishCard('Ikan Bandeng Laut', Colors.orange),
              ],
            ),
          ],
        ),
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
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
      ),
    );
  }
}

class FishCard extends StatelessWidget {
  final String fishName;
  final Color color;

  FishCard(this.fishName, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(fishName, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
