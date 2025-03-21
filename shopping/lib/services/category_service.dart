import 'package:flutter/material.dart';

import '../const/const.dart';
import '../models/category.dart';
import 'supabase_init.dart';


class CategoryService {
  Future<List<Category>> getAllCategory() async {
    try {
      final response = await supabaseClient.from('categories').select();

      final List<Category> categories = (response as List)
          .map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList();
      // Arrange categories by name
      categories.sort((a, b) => a.name.compareTo(b.name));

      // Find and move 'Popular' category to the top
      final popularIndex = categories
          .indexWhere((category) => category.name == AppConst.popular);
      if (popularIndex != -1) {
        final popularCategory = categories.removeAt(popularIndex);
        categories.insert(0, popularCategory);
      }

      return categories;
    } catch (e) {
      // Handle get all category error
      debugPrint('Get all category error: $e');
      rethrow;
    }
  }
}
