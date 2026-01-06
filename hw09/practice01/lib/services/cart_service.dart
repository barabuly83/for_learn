abstract class ICartService {
  Future<void> addToCart(String productId, int quantity);
}

class CartService implements ICartService {
  @override
  Future<void> addToCart(String productId, int quantity) async {
    // Реализация добавления в корзину
    await Future.delayed(const Duration(milliseconds: 100));
  }
}

