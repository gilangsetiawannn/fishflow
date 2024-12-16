import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final List<Map<String, dynamic>> orders = [
    {
      'name': 'Gilang',
      'product': 'Ikan Tuna',
      'quantity': 3,
      'price': 'Rp 150,000',
      'total': 'Rp 450,000',
      'status': 'Belum Dikirim',
    },
    {
      'name': 'Shello',
      'product': 'Udang',
      'quantity': 5,
      'price': 'Rp 100,000',
      'total': 'Rp 500,000',
      'status': 'Sudah Dikirim',
    },
    {
      'name': 'Amay',
      'product': 'Ikan Nila',
      'quantity': 4,
      'price': 'Rp 75,000',
      'total': 'Rp 300,000',
      'status': 'Belum Dikirim',
    },
    {
      'name': 'Setiawan',
      'product': 'Ikan Kerapu',
      'quantity': 2,
      'price': 'Rp 200,000',
      'total': 'Rp 400,000',
      'status': 'Sudah Dikirim',
    },
    {
      'name': 'Juliano',
      'product': 'Ikan Salmon',
      'quantity': 1,
      'price': 'Rp 250,000',
      'total': 'Rp 250,000',
      'status': 'Belum Dikirim',
    },
  ];

  void _updateStatus(int index, String newStatus) {
    setState(() {
      orders[index]['status'] = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: orders.isEmpty
            ? Center(
                child: Text(
                  'Belum ada pesanan.',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              )
            : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        'Nama Pemesan: ${order['name']}',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Produk: ${order['product']}'),
                          Text('Jumlah: ${order['quantity']}'),
                          Text('Harga: ${order['price']}'),
                          Text('Total: ${order['total']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropdownButton<String>(
                            value: order['status'],
                            items: ['Belum Dikirim', 'Sudah Dikirim'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                _updateStatus(index, newValue);
                              }
                            },
                          ),
                          Icon(
                            order['status'] == 'Sudah Dikirim'
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: order['status'] == 'Sudah Dikirim'
                                ? Colors.green
                                : Colors.red,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // background color
            foregroundColor: Colors.white, // text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
            );
          },
          child: Text('Go to Order History'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.blue[50], // Background color of the app
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.blue[900]), // General text color
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/orderHistory': (context) => OrderHistoryScreen(),
    },
  ));
}
