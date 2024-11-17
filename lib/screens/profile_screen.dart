import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 4; // Tab aktif dimulai di Profil (index 4)
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String _selectedRole = ''; // Menyimpan role yang dipilih

  bool _isEditing = false; // Variabel untuk mengecek apakah dalam mode edit

  @override
  Widget build(BuildContext context) {
    // Menerima data profil dari argumen rute
    final Map<String, dynamic>? profileData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Jika data profil ada, isikan ke controller
    if (profileData != null) {
      nameController.text = profileData['name'] ?? '';
      emailController.text = profileData['email'] ?? '';
      phoneController.text = profileData['phone'] ?? '';
      _selectedRole = profileData['role'] ?? ''; // Set role yang sudah ada
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Membuat halaman bisa digulir
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Edit Profil
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing; // Toggle mode edit
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return; // Jika tab yang sama ditekan, abaikan

          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // Fungsi untuk membangun field teks
  Widget buildTextField(String label, TextEditingController controller, bool isEditing) {
    return TextFormField(
      controller: controller,
      readOnly: !isEditing, // Menonaktifkan kemampuan untuk mengedit field jika tidak dalam mode edit
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
    );
  }

  // Fungsi untuk membangun dropdown untuk Role
  Widget buildDropdownField(String label, String selectedValue, bool isEditing) {
    return DropdownButtonFormField<String>(
      value: selectedValue.isEmpty ? null : selectedValue,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
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
          : null, // Jika tidak dalam mode edit, dropdown tidak bisa diubah
    );
  }
}
