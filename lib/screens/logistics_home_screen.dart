import 'package:flutter/material.dart';

class LogisticsHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logistik - Home'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context); // Panggil fungsi logout
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFeatureCard(
              context,
              icon: Icons.chat,
              title: 'Chat Order',
              description: 'Chat dengan pelanggan yang memesan.',
              route: '/chatList',
            ),
            SizedBox(height: 16),
            _buildFeatureCard(
              context,
              icon: Icons.history,
              title: 'Riwayat Pemesanan',
              description: 'Lihat riwayat pemesanan pelanggan.',
              route: '/orderHistory',
            ),
            SizedBox(height: 16),
            _buildFeatureCard(
              context,
              icon: Icons.manage_accounts,
              title: 'Kelola Logistik',
              description: 'Kelola logistik dan pengiriman.',
              route: '/logistics',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required IconData icon, required String title, required String description, required String route}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 50, color: Colors.blue),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Implementasi logout seperti menghapus token atau data pengguna
    Navigator.pushReplacementNamed(context, '/login');
  }
}
