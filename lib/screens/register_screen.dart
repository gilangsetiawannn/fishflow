import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedRole;
  bool isAgreeChecked = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Daftar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D267D),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Nomor',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Konfirmasi Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Pilih Role',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Pembeli', 'Penjual', 'Logistik']
                      .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                      .toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: isAgreeChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isAgreeChecked = value ?? false;
                        });
                      },
                    ),
                    const Text('Setuju dengan syarat dan ketentuan'),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (isAgreeChecked && passwordController.text == confirmPasswordController.text) {
                      final Map<String, String> userData = {
                        'name': nameController.text,
                        'email': emailController.text,
                        'phone': phoneController.text,
                        'role': selectedRole ?? '',
                      };

                      if (selectedRole == 'Logistik') {
                        Navigator.pushReplacementNamed(context, '/logisticsHome', arguments: userData);
                      } else if (selectedRole == 'Penjual') {
                        Navigator.pushReplacementNamed(context, '/penjualHome', arguments: userData);
                      } else {
                        Navigator.pushReplacementNamed(context, '/home', arguments: userData);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Periksa data atau persetujuan terlebih dahulu'),
                        ),
                      );
                    }
                  },
                  child: const Text('Daftar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
