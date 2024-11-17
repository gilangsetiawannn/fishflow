import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF), // Background abu-abu
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Teks "Lupa Password" dengan warna biru tua
                const Text(
                  'Lupa Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D267D), // Biru Tua
                  ),
                ),
                const SizedBox(height: 8),

                // Teks kecil "Masukkan email atau nomor" dengan warna biru tua
                const Text(
                  'Masukkan email atau nomor',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1D267D), // Biru Tua
                  ),
                ),
                const SizedBox(height: 16),

                // Input untuk Email atau Nomor HP
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email atau Nomor HP',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Row untuk menempatkan tombol Submit dan Batal di kanan dan kiri
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tombol Batal berwarna abu-abu di kiri
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1D267D)), // Border biru tua
                      ),
                      onPressed: () => Navigator.pop(context), // Menutup halaman atau kembali
                      child: const Text(
                        'Batal',
                        style: TextStyle(
                          color: Color(0xFF1D267D), // Biru Tua
                        ),
                      ),
                    ),
                    // Tombol Submit berwarna biru tua di kanan
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D267D), // Biru Tua
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/resetPassword'),
                      child: const Text('Submit', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
