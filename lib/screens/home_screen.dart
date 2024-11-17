import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import '../product_model.dart';
import 'profile_screen.dart'; // Import ProfileScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  int _currentIndex = 0; // Menyimpan tab aktif

  final List<Product> _products = [
    Product(
      name: 'Ikan Tuna',
      price: 'Rp 80.000',
      image: 'assets/tuna.jpg',
      description: 'Tuna segar dengan kandungan omega-3 tinggi.',
      isPickUpAvailable: true,
    ),
    Product(
      name: 'Ikan Salmon',
      price: 'Rp 150.000',
      image: 'assets/salmon.jpg',
      description: 'Salmon kaya omega-3, dagingnya kenyal.',
      isPickUpAvailable: false,
    ),
    Product(
      name: 'Cumi',
      price: 'Rp 70.000',
      image: 'assets/cumi.jpg',
      description: 'Cumi segar untuk berbagai hidangan laut.',
      isPickUpAvailable: false,
    ),
    Product(
      name: 'Udang',
      price: 'Rp 100.000',
      image: 'assets/udang.jpg',
      description: 'Udang segar, cocok untuk berbagai hidangan.',
      isPickUpAvailable: false,
    ),
    Product(
      name: 'Ikan Kakap Merah',
      price: 'Rp 90.000',
      image: 'assets/kakap_merah.jpg',
      description: 'Ikan kakap merah segar dengan daging lezat.',
      isPickUpAvailable: false,
    ),
    Product(
      name: 'Ikan Tenggiri',
      price: 'Rp 85.000',
      image: 'assets/tenggiri.jpg',
      description: 'Ikan tenggiri kaya protein.',
      isPickUpAvailable: false,
    ),
    Product(
      name: 'Ikan Kerapu',
      price: 'Rp 120.000',
      image: 'assets/kerapu.jpg',
      description: 'Ikan kerapu segar dan bergizi.',
      isPickUpAvailable: false,
    ),
    Product(
      name: 'Ikan Dori',
      price: 'Rp 95.000',
      image: 'assets/dori.jpg',
      description: 'Ikan dori segar dengan daging yang lembut.',
      isPickUpAvailable: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchResults = List.from(_products);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchResults = _products
          .where((product) =>
              product.name.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onBottomNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 4) { // Index 4 untuk Profil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(), // Pindah ke halaman profil
        ),
      ).then((_) {
        // Kembali ke tab sebelumnya jika kembali dari profil
        setState(() {
          _currentIndex = 0; // Set tab kembali ke Home
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Cari produk...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Best Seller", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _searchResults.length >= 4 ? 4 : _searchResults.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = _searchResults[index];
                        return _buildProductCard(product);
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text("Favorite", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _products.length - 4,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = _products[index + 4];
                        return _buildProductCard(product);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex, // Menyoroti tab yang aktif
        onTap: _onBottomNavigationTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(product.image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(product.price, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            _buildLogisticsInfo(product.isPickUpAvailable),
          ],
        ),
      ),
    );
  }

  Widget _buildLogisticsInfo(bool isAvailable) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.local_shipping,
          color: isAvailable ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 5),
        Text(
          isAvailable ? 'Tersedia' : 'Tidak Tersedia',
          style: TextStyle(
            color: isAvailable ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
