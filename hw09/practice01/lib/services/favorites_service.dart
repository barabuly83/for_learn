abstract class IFavoritesService {
  Future<bool> toggleFavorite(String productId);
  bool isFavorite(String productId);
}

class FavoritesService implements IFavoritesService {
  final Set<String> _favorites = {};

  @override
  Future<bool> toggleFavorite(String productId) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (_favorites.contains(productId)) {
      _favorites.remove(productId);
      return false;
    } else {
      _favorites.add(productId);
      return true;
    }
  }

  @override
  bool isFavorite(String productId) {
    return _favorites.contains(productId);
  }
}

