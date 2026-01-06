import 'rating.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final List<String> imageUrls;
  final double currentPrice;
  final double? oldPrice;
  final Rating rating;
  final bool isOnSale;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.currentPrice,
    this.oldPrice,
    required this.rating,
    this.isOnSale = false,
  });
}

