import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
import '../repositories/favorite_repository.dart';
import 'repository_provider.dart';

part 'favorite_provider.g.dart';

@riverpod
class FavoriteNotifier extends _$FavoriteNotifier {
  late final FavoriteRepository _favoriteRepository;
  late int _userId;

  List<Product> _favoriteProducts = [];
  // List<Product> get favoriteProducts => _favoriteProducts;

  @override
  Future<List<Product>> build(int userId) async {
    _userId = userId;
    _favoriteRepository = ref.read(favoriteServiceProvider);
    final data = await _favoriteRepository.getFavoriteProductsByUserId(userId);
    _favoriteProducts = data;
    return data;
  }

  Future<void> fetchFavoriteProducts() async {
    try {
      _favoriteProducts =
          await _favoriteRepository.getFavoriteProductsByUserId(_userId);
      state = AsyncData(_favoriteProducts);
    } catch (e) {
      debugPrint('Fetch favorite products error: $e');
    }
  }

  Future<void> addFavorite(int productId) async {
    try {
      await _favoriteRepository.insertFavorite(_userId, productId);
      await fetchFavoriteProducts(); // Refresh favorite products
    } catch (e) {
      debugPrint('Add favorite error: $e');
    }
  }

  Future<void> removeFavorite(int productId) async {
    try {
      await _favoriteRepository.removeFavorite(_userId, productId);
      await fetchFavoriteProducts(); // Refresh favorite products
    } catch (e) {
      debugPrint('Remove favorite error: $e');
    }
  }
}
