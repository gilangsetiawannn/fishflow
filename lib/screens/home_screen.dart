import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import '../product_model.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  int _currentIndex = 0;

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
          .where((product) => product.name.toLowerCase().contains(_searchController.text.toLowerCase()))
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

    if (index == 1) {
      Navigator.pushNamed(context, '/keranjang');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/shop');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/kupon'); // Navigasi ke KuponPage
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      ).then((_) {
        setState(() {
          _currentIndex = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FishFlow'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/keranjang_total_produk');
            },
          ),
        ],
      ),
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
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const Text("Best Seller", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                    ]),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = _searchResults[index];
                        return _buildProductCard(product);
                      },
                      childCount: _searchResults.length >= 4 ? 4 : _searchResults.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 20),
                      const Text("Favorite", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                    ]),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = _products[index + 4];
                        return _buildProductCard(product);
                      },
                      childCount: _products.length - 4,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
