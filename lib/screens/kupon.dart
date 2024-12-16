import 'package:flutter/material.dart';
import '../product_model.dart';

class KuponPage extends StatefulWidget {
  const KuponPage({super.key});

  @override
  _KuponPageState createState() => _KuponPageState();
}

class _KuponPageState extends State<KuponPage> {
  int _currentIndex = 2; // Menyoroti tab Rewards sebagai aktif

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
  ];

  void _onBottomNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/keranjang');
    } else if (index == 2) {
      // Tetap di halaman Kupon
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        // Tambahkan aksi jika card di-tap
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kupon',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kupon Info
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "100 Voucher",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        // Tambahkan aksi jika tombol Kode Promo di-tap
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kode Promo",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Promo Spesial",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Dengan Potongan Harga",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return _buildProductCard(product);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
