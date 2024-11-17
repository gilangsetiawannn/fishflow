import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedProductIndex = -1;

  final List<Map<String, String>> products = [
    {"name": "Ikan Lele", "price": "Rp15.000", "description": "Lele segar dari peternakan."},
    {"name": "Ikan Nila", "price": "Rp20.000", "description": "Nila segar dengan kualitas terbaik."},
    {"name": "Ikan Gurame", "price": "Rp30.000", "description": "Gurame berkualitas tinggi."},
    {"name": "Ikan Koi", "price": "Rp50.000", "description": "Koi cantik untuk hiasan kolam."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Ikan', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: selectedProductIndex == -1
          ? GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(products[index]["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(products[index]["price"]!),
                      ],
                    ),
                  ),
                );
              },
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products[selectedProductIndex]["name"]!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1D267D)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Harga: ${products[selectedProductIndex]["price"]}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    products[selectedProductIndex]["description"]!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedProductIndex = -1; // Kembali ke daftar
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D267D),
                    ),
                    child: const Text("Kembali", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
    );
  }
}
