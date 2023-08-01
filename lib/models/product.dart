class Product {
  final String name;
  final String description;
  final String flavor;
  final double price;
  final String imagePath;
  final double rating;
  final int reviewCount;

  Product(
      {required this.name,
      required this.description,
      required this.flavor,
      required this.price,
      required this.imagePath,
      required this.rating,
      required this.reviewCount});
}
