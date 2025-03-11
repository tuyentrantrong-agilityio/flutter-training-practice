import '../models/product.dart';
import 'supabase_init.dart';

class FavoriteService {
  Future<void> insertFavorite(int userId, int productId) async {
    final response = await supabaseClient.from('favorites').insert({
      'user_id': userId,
      'product_id': productId,
      'added_at': DateTime.now().toIso8601String(),
    });

    if (response.error != null) {
      throw Exception('Failed to insert favorite: ${response.error!.message}');
    }
  }

  Future<List<Product>> getFavoriteProductsByUserId(int userId) async {
    final response = await supabaseClient
        .from('favorites')
        .select('product_id, products!inner(*)')
        .eq('user_id', userId);

    final data = response as List<dynamic>;

    return data.map((item) {
      return Product.fromJson(item['products']);
    }).toList();
  }
}
