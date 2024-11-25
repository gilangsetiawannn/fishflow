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
  bool _isEditing = false; // For edit mode
  int _currentIndex = 4; // To highlight the profile tab as active

  // Function to navigate based on bottom navigation index
  void _onBottomNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate based on selected tab index
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 4) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve data passed via arguments
    final Map<String, dynamic>? profileData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (profileData != null) {
      setState(() {
        nameController.text = profileData['name'] ?? '';
        emailController.text = profileData['email'] ?? '';
        phoneController.text = profileData['phone'] ?? '';
        _selectedRole = profileData['role'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView( // Makes the screen scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Image and Edit Button
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://example.com/your-profile-image-url.jpg', // Change URL to user's profile image
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing; // Toggle edit mode
                  });
                },
                child: Text(_isEditing ? 'Selesai Edit' : 'Edit Profil'),
              ),
              const SizedBox(height: 20),
              // Profile Information
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex, // Highlight active tab
        onTap: _onBottomNavigationTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // Helper function to build text fields
  Widget buildTextField(String label, TextEditingController controller, bool isEditing) {
    return TextFormField(
      controller: controller,
      readOnly: !isEditing, // If not editing, make the field read-only
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }

  // Helper function to build the dropdown for selecting a role
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
