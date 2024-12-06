import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifikasi",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          _buildNotificationCard(
              "Ikan Gurame", "Dikirim hari, Selasa 31", "Rp. 30,000"),
          SizedBox(height: 16),
          _buildNotificationCard(
              "Ikan Lele", "Dikirim hari, Senin 20", "Rp. 30,000"),
        ],
      ),
            bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.black,
        currentIndex: 0,  // Set this based on the active tab index
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/keranjang');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/shop');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/kupon');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget _buildNotificationCard(String title, String subtitle, String price) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.radio_button_off, color: Colors.indigo),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
