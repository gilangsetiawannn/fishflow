import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import '../product_model.dart';

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
      storeName: 'Toko Ikan Bahari',
      distributor: 'Distribusi Laut Segar',
      purchaseLimit: 5,
    ),
    Product(
      name: 'Ikan Salmon',
      price: 'Rp 150.000',
      image: 'assets/salmon.jpg',
      description: 'Salmon kaya omega-3, dagingnya kenyal.',
      isPickUpAvailable: false,
      storeName: 'Toko Ikan Bahari',
      distributor: 'Distribusi Laut Segar',
      purchaseLimit: 3,
    ),
    Product(
      name: 'Cumi',
      price: 'Rp 70.000',
      image: 'assets/cumi.jpg',
      description: 'Cumi segar untuk berbagai hidangan laut.',
      isPickUpAvailable: false,
      storeName: 'Toko Laut Nusantara',
      distributor: 'Segar Sentosa',
      purchaseLimit: 10,
    ),
    Product(
      name: 'Udang',
      price: 'Rp 100.000',
      image: 'assets/udang.jpg',
      description: 'Udang segar, cocok untuk berbagai hidangan.',
      isPickUpAvailable: false,
      storeName: 'Toko Laut Nusantara',
      distributor: 'Segar Sentosa',
      purchaseLimit: 8,
    ),
    Product(
      name: 'Ikan Kakap Merah',
      price: 'Rp 90.000',
      image: 'assets/kakap_merah.jpg',
      description: 'Ikan kakap merah segar dengan daging lezat.',
      isPickUpAvailable: false,
      storeName: 'Toko Laut Nusantara',
      distributor: 'Segar Sentosa',
      purchaseLimit: 8,
    ),
    Product(
      name: 'Ikan Tenggiri',
      price: 'Rp 85.000',
      image: 'assets/tenggiri.jpg',
      description: 'Ikan tenggiri kaya protein.',
      isPickUpAvailable: false,
      storeName: 'Toko Ikan Bahari',
      distributor: 'Distribusi Laut Segar',
      purchaseLimit: 8,
    ),
    Product(
      name: 'Ikan Kerapu',
      price: 'Rp 120.000',
      image: 'assets/kerapu.jpg',
      description: 'Ikan kerapu segar dan bergizi.',
      isPickUpAvailable: false,
      storeName: 'Toko Ikan Bahari',
      distributor: 'Distribusi Laut Segar',
      purchaseLimit: 8,
    ),
    Product(
      name: 'Ikan Dori',
      price: 'Rp 95.000',
      image: 'assets/dori.jpg',
      description: 'Ikan dori segar dengan daging yang lembut.',
      isPickUpAvailable: true,
      storeName: 'Toko Ikan Bahari',
      distributor: 'Distribusi Laut Segar',
      purchaseLimit: 8,
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
      body: SingleChildScrollView(
        child: Padding(
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
              const Text("Best Seller", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: _searchResults.length >= 4 ? 4 : _searchResults.length,
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: _products.length - 4,
                itemBuilder: (context, index) {
                  final product = _products[index + 4];
                  return _buildProductCard(product);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/keranjang');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/kupon');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Keranjang'),
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
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.shopping_bag, color: Colors.blue.shade900, size: 16),
                          const SizedBox(width: 4),
                          Text('Batas: ${product.purchaseLimit}', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  product.price,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
                            const SizedBox(height: 4),
              Flexible(
                child: Text(
                  'Toko: ${product.storeName}',
                  style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  'Distributor: ${product.distributor}',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: _buildLogisticsInfo(product.isPickUpAvailable),
              ),
            ],
          ),
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
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
