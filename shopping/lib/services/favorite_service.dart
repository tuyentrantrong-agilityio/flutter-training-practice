import 'package:flutter/material.dart';

import '../models/product.dart';
import 'supabase_init.dart';

class FavoriteService {
  Future<void> insertFavorite(String userId, int productId) async {
    try {
      final response = await supabaseClient.from('favorites').insert({
        'user_id': userId,
        'product_id': productId,
        'added_at': DateTime.now().toIso8601String(),
      });

      if (response.error != null) {
        throw Exception(
          'Failed to insert favorite: ${response.error!.message}',
        );
      } else {
        debugPrint('Favorite inserted successfully');
      }
    } catch (e) {
      // Handle insert favorite error
      debugPrint('Insert favorite error: $e');
      rethrow;
    }
  }

  Future<List<Product>> getFavoriteProductsByUserId(String userId) async {
    try {
      final response = await supabaseClient
          .from('favorites')
          .select('product_id, products!inner(*)')
          .eq('user_id', userId);

      final data = response as List<dynamic>;

      return data.map((item) {
        return Product.fromJson(item['products']);
      }).toList();
    } catch (e) {
      // Handle get favorite products error
      debugPrint('Get favorite products error: $e');
      rethrow;
    }
  }

  Future<void> removeFavorite(String userId, int productId) async {
    try {
      final response = await supabaseClient
          .from('favorites')
          .delete()
          .eq('user_id', userId)
          .eq('product_id', productId);

      if (response.error != null) {
        throw Exception(
          'Failed to remove favorite: ${response.error!.message}',
        );
      } else {
        debugPrint('Favorite removed successfully');
      }
    } catch (e) {
      // Handle remove favorite error
      debugPrint('Remove favorite error: $e');
      rethrow;
    }
  }
}
