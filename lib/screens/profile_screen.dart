import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'Nama Pengguna';
  String _email = 'email@contoh.com';
  String _phoneNumber = '(\u002B62) 812-0000-0000';
  int _currentIndex = 3; // Menyoroti tab Profil sebagai aktif

  void _editField(String field, String currentValue, Function(String) onSaved) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController controller = TextEditingController(text: currentValue);
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: field,
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                onSaved(controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _onBottomNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/keranjang');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/kupon');
    } else if (index == 3) {
      // Tetap di halaman Profil
    }
  }

  void _handleLogout() {
    // Logika untuk keluar, misalnya menghapus token atau session
    Navigator.pushReplacementNamed(context, '/login'); // Mengarahkan pengguna ke halaman login setelah keluar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_placeholder.png'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan aksi untuk mengedit profil
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Edit Profil'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ListTile(
                leading: Icon(Icons.person, color: Colors.blue.shade900),
                title: Text('Nama'),
                subtitle: Text(_name),
                trailing: Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  _editField('Nama', _name, (value) {
                    setState(() {
                      _name = value;
                    });
                  });
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.email, color: Colors.blue.shade900),
                title: Text('Alamat Email'),
                subtitle: Text(_email),
                trailing: Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  _editField('Alamat Email', _email, (value) {
                    setState(() {
                      _email = value;
                    });
                  });
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.blue.shade900),
                title: Text('Nomor Handphone'),
                subtitle: Text(_phoneNumber),
                trailing: Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  _editField('Nomor Handphone', _phoneNumber, (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  });
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _handleLogout, // Panggil fungsi _handleLogout saat tombol ditekan
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  ),
                  child: Text(
                    'Keluar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/resetPassword');
                  },
                  child: Text(
                    'Reset Password ?',
                    style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
