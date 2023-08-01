import 'package:suger_treatz/models/product.dart';

class CartItem {
  final String name;
  final String flavor;
  final double price;
  int? count;
  final String imagePath;

  CartItem({
    required this.name,
    required this.flavor,
    required this.price,
    required this.count,
    required this.imagePath,
  });
}
