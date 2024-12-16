import 'package:flutter/material.dart';

class PromoCodeSelectionPage extends StatefulWidget {
  const PromoCodeSelectionPage({super.key});

  @override
  _PromoCodeSelectionPageState createState() => _PromoCodeSelectionPageState();
}

class _PromoCodeSelectionPageState extends State<PromoCodeSelectionPage> {
  final List<Map<String, String>> _promoCodes = [
    {
      'title': '25k off.',
      'details': 'Min. spend 100k • BSI Credit Cards',
    },
    {
      'title': '20k off.',
      'details': 'Min. spend 100k • Panin Credit Cards',
    },
    {
      'title': '15k off.',
      'details': 'Min. spend 100k • Mandiri Debit Cards',
    },
    {
      'title': '75k off.',
      'details': '',
    },
  ];

  void _applyPromoCode(String promoCode) {
    Navigator.pop(context, promoCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Promo'),
        backgroundColor: Colors.white, // Set header background to white
        foregroundColor: Colors.black, // Set header text color to black
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Promos untuk Pengiriman",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _promoCodes.length,
                itemBuilder: (context, index) {
                  final promo = _promoCodes[index];
                  return PromoCard(
                    title: promo['title']!,
                    details: promo['details']!,
                    onTap: () {
                      _applyPromoCode(promo['title']!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String title;
  final String details;
  final VoidCallback onTap;

  const PromoCard({
    super.key,
    required this.title,
    required this.details,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 4), // Adjusted for better spacing
            Text(
              details,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8), // Adjusted for better spacing
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Terapkan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
