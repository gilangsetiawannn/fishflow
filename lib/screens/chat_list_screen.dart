import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {'name': 'Gilang', 'lastMessage': 'Terima kasih!', 'avatar': Icons.person},
    {'name': 'Shello', 'lastMessage': 'Pesanan saya sudah sampai?', 'avatar': Icons.person},
    {'name': 'Amay', 'lastMessage': 'Bisa kirim lebih cepat?', 'avatar': Icons.person},
    {'name': 'Setiawan', 'lastMessage': 'Produk bagus!', 'avatar': Icons.person},
    {'name': 'Juliano', 'lastMessage': 'Tunggu konfirmasi.', 'avatar': Icons.person},
  ];

  ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat - Logistik'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: Icon(user['avatar']),
            ),
            title: Text(user['name']),
            subtitle: Text(user['lastMessage']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
