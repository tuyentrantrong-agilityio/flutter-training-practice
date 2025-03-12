import 'package:flutter/material.dart';

import '../models/category.dart';
import 'supabase_init.dart';

class CategoryService {
  Future<List<Category>> getAllCategory() async {
    try {
      final response = await supabaseClient.from('categories').select();

      final List<Category> categories = (response as List)
          .map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList();

      return categories;
    } catch (e) {
      // Handle get all category error
      debugPrint('Get all category error: $e');
      rethrow;
    }
  }
}
