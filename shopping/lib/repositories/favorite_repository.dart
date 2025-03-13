import 'package:flutter/material.dart';

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
    try {
      await _favoriteService.insertFavorite(userId, productId);
    } catch (e) {
      // Handle insert favorite error
      debugPrint('Insert favorite error: $e');
      rethrow;
    }
  }

  @override
  Future<List<Product>> getFavoriteProductsByUserId(String userId) async {
    try {
      return await _favoriteService.getFavoriteProductsByUserId(userId);
    } catch (e) {
      // Handle get favorite products error
      debugPrint('Get favorite products error: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeFavorite(String userId, int productId) async {
    try {
      await _favoriteService.removeFavorite(userId, productId);
    } catch (e) {
      // Handle remove favorite error
      debugPrint('Remove favorite error: $e');
      rethrow;
    }
  }
}
