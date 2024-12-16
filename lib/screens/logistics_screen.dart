import 'package:flutter/material.dart';

class LogisticsScreen extends StatefulWidget {
  const LogisticsScreen({super.key});

  @override
  _LogisticsScreenState createState() => _LogisticsScreenState();
}

class _LogisticsScreenState extends State<LogisticsScreen> {
  final List<Map<String, dynamic>> orders = [
{
      'name': 'Gilang',
      'product': 'Ikan Tuna',
      'quantity': 3,
      'price': 'Rp 150,000',
      'total': 'Rp 450,000',
      'status': 'Belum Dikirim',
      'address': 'Jl. Klamono RT 75 Muara Rapak',
      'image': 'assets/tuna.jpg',  
    },
    {
      'name': 'Shello',
      'product': 'Udang',
      'quantity': 5,
      'price': 'Rp 100,000',
      'total': 'Rp 500,000',
      'status': 'Sudah Dikirim',
      'address': 'Jl. Sei wain Km 15 Kost JK ',
      'image': 'assets/udang.jpg',  
    },
    {
      'name': 'Setiawan',
      'product': 'Ikan Kerapu',
      'quantity': 2,
      'price': 'Rp 200,000',
      'total': 'Rp 400,000',
      'status': 'Sudah Dikirim',
      'address': 'Jl. Kenanga RT 77 N0. 16 Balikpapan Barat',
      'image': 'assets/udang.jpg', 
    },
    {
      'name': 'Juliano',
      'product': 'Ikan Salmon',
      'quantity': 1,
      'price': 'Rp 250,000',
      'total': 'Rp 250,000',
      'status': 'Belum Dikirim',
      'address': 'Jl. Karang Rejo Gg. Melati indah RT 76',
      'image': 'assets/salmon.jpg',  
    },    
  ];

  void _showOrderDetails(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(order['image'])),
                  SizedBox(height: 10),
                  _buildDetailRow('Nama Pemesan', order['name']),
                  _buildDetailRow('Produk', order['product']),
                  _buildDetailRow('Jumlah', order['quantity'].toString()),
                  _buildDetailRow('Harga', order['price']),
                  _buildDetailRow('Total', order['total']),
                  _buildDetailRow('Alamat', order['address']),
                  _buildDetailRow('Status', order['status']),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logistik - Logistik Yaya'),
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
                  return GestureDetector(
                    onTap: () {
                      _showOrderDetails(context, order);
                    },
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                order['image'],
                                height: 80.0,
                                width: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order['name'],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Produk: ${order['product']}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Text(
                                    'Jumlah: ${order['quantity']}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Text(
                                    'Harga: ${order['price']}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Text(
                                    'Total: ${order['total']}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}


