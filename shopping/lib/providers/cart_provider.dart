import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/cart_item_viewmodel.dart';
import '../models/product.dart';
import '../repositories/cart_repository.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  late final CartRepository _cartRepository;

  List<CartItemViewModel> _cartItems = [];
  List<CartItemViewModel> get cartItems => _cartItems;

  @override
  Future<void> build() async {
    // Initialize provider state if needed
  }

  Future<void> fetchCartItems(int userId) async {
    try {
      _cartItems = await _cartRepository.getCartItemsWithProductDetails(userId);
    } catch (e) {
      debugPrint('Fetch cart items error: $e');
    }
  }

  Future<void> addProductToCart(int cartId, int productId, int quantity) async {
    try {
      await _cartRepository.addProductToCart(cartId, productId, quantity);
      await fetchCartItems(cartId); // Refresh cart items
    } catch (e) {
      debugPrint('Add product to cart error: $e');
    }
  }

  Future<void> removeProductFromCart(int cartId, int productId) async {
    try {
      await _cartRepository.removeProductFromCart(cartId, productId);
      await fetchCartItems(cartId); // Refresh cart items
    } catch (e) {
      debugPrint('Remove product from cart error: $e');
    }
  }

  Future<void> updateProductQuantity(
    int cartId,
    int productId,
    int quantity,
  ) async {
    try {
      await _cartRepository.updateProductQuantity(cartId, productId, quantity);
      // Refresh cart items
      await fetchCartItems(cartId);
    } catch (e) {
      debugPrint('Update product quantity error: $e');
    }
  }

  Future<void> addMultipleProductsToCart(
    int cartId,
    List<Product> products,
  ) async {
    try {
      await _cartRepository.addMultipleProductsToCart(cartId, products);
      // Refresh cart items
      await fetchCartItems(cartId);
    } catch (e) {
      debugPrint('Add multiple products to cart error: $e');
    }
  }
}
