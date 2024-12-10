import 'package:flutter/material.dart';

class AlamatPengirimanPage extends StatefulWidget {
  final String initialAddress;
  final String initialName;
  final String initialPhone;

  const AlamatPengirimanPage({super.key, required this.initialAddress, required this.initialName, required this.initialPhone});

  @override
  _AlamatPengirimanPageState createState() => _AlamatPengirimanPageState();
}

class _AlamatPengirimanPageState extends State<AlamatPengirimanPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.initialName;
    _phoneController.text = widget.initialPhone;
    _addressController.text = widget.initialAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alamat Pengiriman"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Penerima',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Alamat Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': _nameController.text,
                  'phone': _phoneController.text,
                  'address': _addressController.text,
                });
              },
              child: Text("Selesai"),
            ),
          ],
        ),
      ),
    );
  }
}
