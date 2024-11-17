import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/product_detail_screen.dart';
import 'product_model.dart'; // Import model Product

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Menggunakan halaman login sebagai halaman awal
      home: const LoginScreen(),
      // Mengatur rute navigasi
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/resetPassword': (context) => const ResetPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        // Menggunakan ProductDetailScreen dengan product default
        '/productDetail': (context) => ProductDetailScreen(
          product: Product(
            name: 'Default Product',
            price: 'Rp 0',
            image: 'assets/default_image.jpg',
            description: 'Deskripsi tidak tersedia.',
            isPickUpAvailable: false,
          ),
        ),
      },
    );
  }
}
