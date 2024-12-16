import 'package:fishflow/screens/keranjang_model.dart';
import 'package:fishflow/screens/promo_selection_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fishflow/screens/keranjang.dart';
import 'package:fishflow/screens/keranjang_total_produk.dart';
import 'package:fishflow/screens/login_screen.dart';
import 'package:fishflow/screens/register_screen.dart';
import 'package:fishflow/screens/forgot_password_screen.dart';
import 'package:fishflow/screens/reset_password_screen.dart';
import 'package:fishflow/screens/home_screen.dart' as home;
import 'package:fishflow/screens/profile_screen.dart';
import 'package:fishflow/screens/product_detail_screen.dart'; // Import halaman untuk pembeli
import 'package:fishflow/screens/product_detail_penjual.dart'; // Import halaman untuk penjual
import 'package:fishflow/screens/kupon.dart';
import 'package:fishflow/screens/alamat_pengiriman.dart';
import 'package:fishflow/screens/checkout.dart';
import 'package:fishflow/screens/notifikasi_konfirmasi.dart';
import 'package:fishflow/screens/notifikasi.dart';
import 'package:fishflow/screens/opsi_pengiriman.dart';
import 'package:fishflow/screens/pesanan_diterima.dart';
import 'package:fishflow/product_model.dart';
import 'package:fishflow/screens/logistics_home_screen.dart';
import 'package:fishflow/screens/logistics_screen.dart';
import 'package:fishflow/screens/order_history_screen.dart' as orderHistory;
import 'package:fishflow/screens/chat_list_screen.dart';
import 'package:fishflow/screens/chat_screen.dart';
import 'package:fishflow/screens/penjual_home.dart'; // Import halaman PenjualHomePage
import 'package:fishflow/screens/add_product.dart'; // Import halaman AddProductScreen
import 'package:fishflow/screens/penjual_profile.dart'; // Import halaman PenjualProfileScreen
import 'package:fishflow/screens/produk.dart'; // Import halaman ProdukPage
import 'package:fishflow/screens/penjual_notifikasi.dart'; // Import halaman Notifikasi Penjual
import 'package:fishflow/screens/detail_notifikasi_penjual.dart'; // Import halaman Detail Notifikasi Penjual
// Import halaman Notifikasi Pembeli jika diperlukan

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
        '/': (context) => const home.HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/resetPassword': (context) => const ResetPasswordScreen(),
        '/home': (context) => const home.HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/keranjang': (context) => Keranjang(),
        '/keranjang_total_produk': (context) => KeranjangTotalProduk(),
        '/kupon': (context) => KuponPage(),
        '/checkout': (context) => CheckoutPage(),
        '/alamat_pengiriman': (context) => AlamatPengirimanPage(
          initialAddress: '',
          initialName: '',
          initialPhone: '',
        ),
        '/notifikasi_konfirmasi': (context) => NotifikasiKonfirmasiPage(),
        '/notifikasi': (context) => NotifikasiPage(),
        '/opsi_pengiriman': (context) => OpsiPengiriman(
          initialOption: 'Standar',
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
        '/productDetailPenjual': (context) => ProductDetail(product: {}), // Halaman detail untuk penjual
        '/logisticsHome': (context) => LogisticsHomeScreen(),
        '/logistics': (context) => LogisticsScreen(),
        '/orderHistory': (context) => orderHistory.OrderHistoryScreen(),
        '/chatList': (context) => ChatListScreen(),
        '/chat': (context) => ChatScreen(user: {}),
        '/penjualHome': (context) => PenjualHomePage(),
        '/addProduct': (context) => AddProductScreen(),
        '/penjualProfile': (context) => PenjualProfileScreen(), // Tambahkan route untuk PenjualProfileScreen
        '/produk': (context) => ProdukPage(), // Tambahkan route untuk ProdukPage
        '/penjualNotifikasi': (context) => PenjualNotifikasiPage(), // Tambahkan route untuk PenjualNotifikasiPage
        '/detailNotifikasiPenjual': (context) => DetailNotifikasiPenjualPage(notifikasi: {}), // Tambahkan route untuk DetailNotifikasiPenjualPage
        // '/pembeliNotifikasi': (context) => PembeliNotifikasiPage(), // Tambahkan route untuk Notifikasi Pembeli jika diperlukan
      },
    );
  }
}
