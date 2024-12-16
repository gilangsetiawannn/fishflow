import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, String> product;

  ProductDetail({required this.product});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late TextEditingController _namaController;
  late TextEditingController _hargaController;
  late TextEditingController _deskripsiController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.product['nama']);
    _hargaController = TextEditingController(text: widget.product['harga']);
    _deskripsiController = TextEditingController(text: widget.product['deskripsi']);
  }

  void _saveChanges() {
    setState(() {
      widget.product['nama'] = _namaController.text;
      widget.product['harga'] = _hargaController.text;
      widget.product['deskripsi'] = _deskripsiController.text;
    });
    Navigator.pop(context, widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk Penjual', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _namaController,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _hargaController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Harga (Rp/kg)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text('Status Produk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Tersedia', style: TextStyle(fontSize: 16, color: Colors.green)),
              SizedBox(height: 20),
              TextField(
                controller: _deskripsiController,
                style: TextStyle(fontSize: 16),
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Produk',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
