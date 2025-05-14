import 'package:flutter/material.dart';

import '../models/product.dart';
import 'supabase_init.dart';

class ProductService {
  Future<List<Product>> getAllProduct() async {
    try {
      final response = await supabaseClient
          .from('products')
          .select('product_id, name, price, image_url, category_id, stock');

      final List<Product> products = (response as List)
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();

      return products;
    } catch (e) {
      // Handle error
      debugPrint('Error fetching all products: $e');
      rethrow;
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await supabaseClient
          .from('products')
          .select()
          .eq('product_id', id)
          .single();

      return Product.fromJson(response);
    } catch (e) {
      // Handle error
      debugPrint('Error fetching product by ID: $e');
      rethrow;
    }
  }
}
