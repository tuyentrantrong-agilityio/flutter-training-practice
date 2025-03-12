import 'package:flutter/material.dart';
import 'package:shopping/models/product.dart';

import '../models/cart_item_viewmodel.dart';
import '../services/cart_service.dart';

abstract class CartRepository {
  Future<List<CartItemViewModel>> getCartItemsWithProductDetails(int userId);
  Future<void> addProductToCart(int cartId, int productId, int quantity);
  Future<void> removeProductFromCart(int cartId, int productId);
  Future<void> updateProductQuantity(
    int cartId,
    int productId,
    int quantity,
  );
  Future<void> addMultipleProductsToCart(
    int cartId,
    List<Product> products,
  );
}

class CartRepositoryImpl implements CartRepository {
  final CartService _cartService;

  CartRepositoryImpl(this._cartService);

  @override
  Future<List<CartItemViewModel>> getCartItemsWithProductDetails(
    int userId,
  ) async {
    try {
      return await _cartService.getCartItemsWithProductDetails(userId);
    } catch (e) {
      // Handle get cart items error
      debugPrint('Get cart items error: $e');
      rethrow;
    }
  }

  @override
  Future<void> addProductToCart(
    int cartId,
    int productId,
    int quantity,
  ) async {
    try {
      await _cartService.addProductToCart(cartId, productId, quantity);
    } catch (e) {
      // Handle add product to cart error
      debugPrint('Add product to cart error: $e');
      rethrow;
    }
  }
  
  @override
  Future<void> addMultipleProductsToCart(
    int cartId,
    List<Product> products,
  ) async {
    try {
      for (final product in products) {
        await _cartService.addProductToCart(cartId, product.productId!, 1);
      }
    } catch (e) {
      // Handle add multiple products to cart error
      debugPrint('Add multiple products to cart error: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeProductFromCart(int cartId, int productId) async {
    try {
      await _cartService.removeProductFromCart(cartId, productId);
    } catch (e) {
      // Handle remove product from cart error
      debugPrint('Remove product from cart error: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateProductQuantity(
    int cartId,
    int productId,
    int quantity,
  ) async {
    try {
      await _cartService.updateProductQuantity(cartId, productId, quantity);
    } catch (e) {
      // Handle update product quantity error
      debugPrint('Update product quantity error: $e');
      rethrow;
    }
  }
}
