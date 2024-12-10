import 'package:fishflow/screens/keranjang_model.dart';
import 'package:fishflow/screens/promo_selection_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fishflow/screens/keranjang.dart';
import 'package:fishflow/screens/keranjang_total_produk.dart';
import 'package:fishflow/screens/login_screen.dart';
import 'package:fishflow/screens/register_screen.dart';
import 'package:fishflow/screens/forgot_password_screen.dart';
import 'package:fishflow/screens/reset_password_screen.dart'; // Import ResetPasswordScreen
import 'package:fishflow/screens/home_screen.dart';
import 'package:fishflow/screens/profile_screen.dart';
import 'package:fishflow/screens/product_detail_screen.dart';
import 'package:fishflow/screens/kupon.dart';
import 'package:fishflow/screens/alamat_pengiriman.dart';
import 'package:fishflow/screens/checkout.dart';
import 'package:fishflow/screens/notifikasi_konfirmasi.dart';
import 'package:fishflow/screens/notifikasi.dart';
import 'package:fishflow/screens/opsi_pengiriman.dart';
import 'package:fishflow/screens/pesanan_diterima.dart';
import 'package:fishflow/product_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: const MyApp(),
    ),
  );
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
        '/profile': (context) => ProfileScreen(),
        '/keranjang': (context) => Keranjang(),
        '/keranjang_total_produk': (context) => KeranjangTotalProduk(),
        '/kupon': (context) => KuponPage(),
        '/checkout': (context) => CheckoutPage(),
        '/alamat_pengiriman': (context) => AlamatPengirimanPage(
          initialAddress: '', // Provide default values or manage differently
          initialName: '',
          initialPhone: '',
        ),
        '/notifikasi_konfirmasi': (context) => NotifikasiKonfirmasiPage(),
        '/notifikasi': (context) => NotifikasiPage(),
        '/opsi_pengiriman': (context) => OpsiPengiriman(
          initialOption: 'Standar', // Provide default value or manage differently
        ),
        '/pesanan_diterima': (context) => PesananDiterima(),
        '/promo_code_selection': (context) => PromoCodeSelectionPage(),
        '/productDetail': (context) => ProductDetailScreen(
          product: Product(
            name: 'Default Product',
            price: 'Rp 0',
            image: 'assets/default_image.jpg',
            description: 'Deskripsi tidak tersedia.',
            isPickUpAvailable: false,
            storeName: 'Default Store',
            distributor: 'Default Distributor',
            purchaseLimit: 0,
          ),
        ),
      },
    );
  }
}
