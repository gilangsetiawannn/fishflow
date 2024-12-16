import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  int _currentIndex = 3; // Menyoroti tab Tambah sebagai aktif
  String _shippingOption = 'Tidak'; // Default value for dropdown
  final TextEditingController _jenisIkanController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

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
      // Tetap di halaman AddProduct
    } else if (index == 4) {
      Navigator.pushReplacementNamed(context, '/penjualProfile');
    }
  }

  void _addProduct() {
    final newProduct = {
      'nama': _jenisIkanController.text,
      'tanggal': DateTime.now().toString().split(' ')[0],
      'pengiriman': _shippingOption
    };
    Navigator.pushReplacementNamed(context, '/produk', arguments: newProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Produk', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/penjualHome'); // Kembali ke halaman home
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_a_photo),
                label: Text('Tambah Foto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Jenis Ikan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _jenisIkanController,
              decoration: InputDecoration(
                hintText: 'Masukkan Jenis Ikan',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              ),
            ),
            SizedBox(height: 20),
            Text('Deskripsi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _deskripsiController,
              decoration: InputDecoration(
                hintText: 'Masukkan Deskripsi',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              ),
            ),
            SizedBox(height: 20),
            Text('Harga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _hargaController,
              decoration: InputDecoration(
                hintText: 'Rp.0',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Menyediakan Pengiriman:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _shippingOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      _shippingOption = newValue!;
                    });
                  },
                  items: <String>['Ya', 'Tidak']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: _addProduct,
                child: Text('Selesai'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                ),
              ),
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
