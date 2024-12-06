import 'package:flutter/material.dart';
import 'package:fishflow/screens/keranjang.dart';
import 'package:fishflow/screens/keranjang_total_produk.dart';
import 'package:fishflow/screens/login_screen.dart';
import 'package:fishflow/screens/register_screen.dart';
import 'package:fishflow/screens/forgot_password_screen.dart';
import 'package:fishflow/screens/reset_password_screen.dart';
import 'package:fishflow/screens/home_screen.dart';
import 'package:fishflow/screens/profile_screen.dart';
import 'package:fishflow/screens/product_detail_screen.dart';
import 'package:fishflow/screens/kupon.dart'; // Import KuponPage
import 'package:fishflow/screens/alamat_pengiriman.dart'; // Import AlamatPengirimanPage
import 'package:fishflow/screens/checkout.dart'; // Import CheckoutPage
import 'package:fishflow/screens/notifikasi_konfirmasi.dart'; // Import NotifikasiKonfirmasiPage
import 'package:fishflow/screens/notifikasi.dart'; // Import NotifikasiPage
import 'package:fishflow/screens/opsi_pengiriman.dart'; // Import OpsiPengirimanPage
import 'package:fishflow/screens/pesanan_diterima.dart'; // Import PesananDiterimaPage
import 'package:fishflow/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/resetPassword': (context) => const ResetPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/keranjang': (context) => Keranjang(),
        '/keranjang_total_produk': (context) => KeranjangTotalProduk(),
        '/kupon': (context) => KuponPage(),
        '/checkout': (context) => CheckoutPage(),
        '/alamat_pengiriman': (context) => AlamatPengirimanPage(),
        '/notifikasi_konfirmasi': (context) => NotifikasiKonfirmasiPage(), // Tambahkan rute untuk NotifikasiKonfirmasiPage
        '/notifikasi': (context) => NotifikasiPage(), // Tambahkan rute untuk NotifikasiPage
        '/opsi_pengiriman': (context) => OpsiPengiriman(), // Tambahkan rute untuk OpsiPengirimanPage
        '/pesanan_diterima': (context) => PesananDiterima(), // Tambahkan rute untuk PesananDiterimaPage
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
