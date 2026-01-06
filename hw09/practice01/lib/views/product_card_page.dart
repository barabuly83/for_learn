import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_card_view_model.dart';
import '../models/product.dart';
import '../models/rating.dart';
import '../services/cart_service.dart';
import '../services/favorites_service.dart';
import '../widgets/product_card.dart';

class ProductCardPage extends StatelessWidget {
  const ProductCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Создаем тестовый продукт согласно скриншоту
    final product = Product(
      id: '1',
      name: 'Смартфон SuperPhone X10',
      description: 'Новый флагманский смартфон с лучшей камерой на рынке и мощным процессором',
      imageUrls: [
        'https://ir.ozone.ru/s3/multimedia-1-6/wc1000/7210921758.jpg',
      ],
      currentPrice: 999,
      oldPrice: 1200,
      rating: const Rating(value: 5.0),
      isOnSale: true,
    );

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Карточка товара'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (_) => ProductCardViewModel(
          product: product,
          cartService: CartService(),
          favoritesService: FavoritesService(),
        ),
        child: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: ProductCard(),
          ),
        ),
      ),
    );
  }
}

