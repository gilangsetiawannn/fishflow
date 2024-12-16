import 'package:flutter/material.dart';

class OpsiPengiriman extends StatefulWidget {
  final String initialOption;

  const OpsiPengiriman({super.key, required this.initialOption});

  @override
  _OpsiPengirimanState createState() => _OpsiPengirimanState();
}

class _OpsiPengirimanState extends State<OpsiPengiriman> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opsi Pengiriman"),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text('Standar'),
            subtitle: Text('Dikirim antara 9-12 Desember'),
            value: 'Standar',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text('Express'),
            subtitle: Text('Dikirim antara 7-9 Desember'),
            value: 'Express',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text('Ekonomi'),
            subtitle: Text('Dikirim antara 10-15 Desember'),
            value: 'Ekonomi',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value.toString();
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _selectedOption); // Kembali ke Checkout dengan opsi terpilih
            },
            child: Text("Selesai"),
          ),
        ],
      ),
    );
  }
}
