import '../models/product.dart';
import '../services/favorite_service.dart';

abstract class FavoriteRepository {
  Future<void> insertFavorite(String userId, int productId);
  Future<List<Product>> getFavoriteProductsByUserId(String userId);
  Future<void> removeFavorite(String userId, int productId);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteService _favoriteService;

  FavoriteRepositoryImpl(this._favoriteService);

  @override
  Future<void> insertFavorite(String userId, int productId) async {
    await _favoriteService.insertFavorite(userId, productId);
  }

  @override
  Future<List<Product>> getFavoriteProductsByUserId(String userId) async {
    return _favoriteService.getFavoriteProductsByUserId(userId);
  }

  @override
  Future<void> removeFavorite(String userId, int productId) async {
    await _favoriteService.removeFavorite(userId, productId);
  }
}
