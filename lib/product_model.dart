class Product {
  final String name;
  final String price;
  final String image;
  final String description;
  final bool isPickUpAvailable;
  final String storeName;
  final String distributor;
  final int purchaseLimit;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.isPickUpAvailable,
    required this.storeName,
    required this.distributor,
    required this.purchaseLimit,
  });
}
