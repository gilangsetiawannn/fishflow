import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String _selectedRole = '';
  bool _isEditing = false;
  int _currentIndex = 3;

  void _onBottomNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/keranjang');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/kupon'); // Navigasi ke halaman Kupon
    } else if (index == 3) {
    }
  }

  void _logout() {
    // Logic untuk logout dan kembali ke halaman login
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://example.com/your-profile-image-url.jpg',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
                child: Text(_isEditing ? 'Selesai Edit' : 'Edit Profil'),
              ),
              const SizedBox(height: 20),
              buildTextField("Nama", nameController, _isEditing),
              const SizedBox(height: 10),
              buildTextField("Email", emailController, _isEditing),
              const SizedBox(height: 10),
              buildTextField("Nomor", phoneController, _isEditing),
              const SizedBox(height: 10),
              buildDropdownField("Role", _selectedRole, _isEditing),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text('Logout'),
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

  Widget buildTextField(String label, TextEditingController controller, bool isEditing) {
    return TextFormField(
      controller: controller,
      readOnly: !isEditing,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }

  Widget buildDropdownField(String label, String selectedValue, bool isEditing) {
    return DropdownButtonFormField<String>(
      value: selectedValue.isEmpty ? null : selectedValue,
      items: const [
        DropdownMenuItem(value: 'Pembeli', child: Text('Pembeli')),
        DropdownMenuItem(value: 'Penjual', child: Text('Penjual')),
        DropdownMenuItem(value: 'Logistik', child: Text('Logistik')),
      ],
      onChanged: isEditing
          ? (String? newValue) {
              setState(() {
                _selectedRole = newValue ?? '';
              });
            }
          : null,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}
