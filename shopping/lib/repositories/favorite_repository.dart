import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/favorite_service.dart';

abstract class FavoriteRepository {
  Future<void> insertFavorite(int userId, int productId);
  Future<List<Product>> getFavoriteProductsByUserId(int userId);
  Future<void> removeFavorite(int userId, int productId);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteService _favoriteService;

  FavoriteRepositoryImpl(this._favoriteService);

  @override
  Future<void> insertFavorite(int userId, int productId) async {
    try {
      await _favoriteService.insertFavorite(userId, productId);
    } catch (e) {
      // Handle insert favorite error
      debugPrint('Insert favorite error: $e');
      rethrow;
    }
  }

  @override
  Future<List<Product>> getFavoriteProductsByUserId(int userId) async {
    try {
      return await _favoriteService.getFavoriteProductsByUserId(userId);
    } catch (e) {
      // Handle get favorite products error
      debugPrint('Get favorite products error: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeFavorite(int userId, int productId) async {
    try {
      await _favoriteService.removeFavorite(userId, productId);
    } catch (e) {
      // Handle remove favorite error
      debugPrint('Remove favorite error: $e');
      rethrow;
    }
  }
}
