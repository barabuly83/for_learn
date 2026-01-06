import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/cart_service.dart';
import '../services/favorites_service.dart';

class ProductCardViewModel extends ChangeNotifier {
  final Product product;
  final ICartService cartService;
  final IFavoritesService favoritesService;

  ProductCardViewModel({
    required this.product,
    required this.cartService,
    required this.favoritesService,
  }) {
    _isFavorite = favoritesService.isFavorite(product.id);
    _quantity = 1;
  }

  bool _isFavorite = false;
  int _quantity = 1;
  bool _isLoading = false;
  bool _isFavoriteLoading = false;

  bool get isFavorite => _isFavorite;
  int get quantity => _quantity;
  bool get isLoading => _isLoading;
  bool get isFavoriteLoading => _isFavoriteLoading;

  // Логика расчета цены (SRP - вынесена из виджета)
  double get totalPrice {
    final quantityForPrice = _quantity == 0 ? 1 : _quantity;
    return product.currentPrice * quantityForPrice;
  }

  double? get totalOldPrice {
    if (product.oldPrice == null) return null;
    final quantityForPrice = _quantity == 0 ? 1 : _quantity;
    return product.oldPrice! * quantityForPrice;
  }

  Future<void> toggleFavorite() async {
    if (_isFavoriteLoading) return;
    
    _isFavoriteLoading = true;
    notifyListeners();

    try {
      _isFavorite = await favoritesService.toggleFavorite(product.id);
    } finally {
      _isFavoriteLoading = false;
      notifyListeners();
    }
  }

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }

  Future<String> addToCart() async {
    if (_isLoading) return 'Операция уже выполняется';
    
    // Проверка на количество = 0
    if (_quantity == 0) {
      return 'Вы должны добавить хотя бы один товар';
    }
    
    _isLoading = true;
    notifyListeners();

    try {
      await cartService.addToCart(product.id, _quantity);
      return 'Товар добавлен в корзину (количество: $_quantity)';
    } catch (e) {
      return 'Ошибка при добавлении в корзину: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}

