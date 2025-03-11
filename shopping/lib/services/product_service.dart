import 'package:flutter/material.dart';

import '../models/product.dart';
import 'supabase_init.dart';

class ProductService {
  Future<List<Product>> getAllProduct() async {
    try {
      final response = await supabaseClient.from('products').select();

      final List<Product> products = (response as List)
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();

      return products;
    } catch (e) {
      // Handle sign up error
      debugPrint('Sign up error: $e');
      rethrow;
    }
  }
}
