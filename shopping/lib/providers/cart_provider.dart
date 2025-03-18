import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping/providers/repository_provider.dart';
import '../models/cart_item.dart';
import '../models/cart_item_viewmodel.dart';
import '../models/product.dart';
import '../repositories/cart_repository.dart';
import '../services/storage/storage.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  late final CartRepository _cartRepository;
  late int _cartId;
  late List<CartItemViewModel> _cartItems;

  @override
  Future<List<CartItemViewModel>> build() async {
    _cartRepository = ref.read(cartServiceProvider);
    _cartId = UserStorage.getCartId();
    final data = await _cartRepository.getCartItemsWithProductDetails(_cartId);
    _cartItems = data;
    debugPrint('Fetch cart items in build: $_cartItems');
    return data;
  }

  Future<void> fetchCartItems() async {
    try {
      _cartItems =
          await _cartRepository.getCartItemsWithProductDetails(_cartId);
      // state = AsyncData(_cartItems);
    } catch (e) {
      rethrow;
    }
  }

  CartItemViewModel? findCartItem(int productId) {
    try {
      return _cartItems
          .firstWhere((item) => item.product.productId == productId);
    } catch (e) {
      return null;
    }
  }

  Future<void> addProductToCart(Product product, int quantity) async {
    try {
      // Ensure the initial build has been done
      if (state is AsyncLoading) {
        await future;
      }
      final existingItem = findCartItem(product.productId!);
      if (existingItem != null) {
        // Product already exists, update quantity
        final updatedItem = existingItem.copyWith(
          cartItem: existingItem.cartItem.copyWith(
            quantity: existingItem.cartItem.quantity + quantity,
          ),
        );
        final index = _cartItems.indexOf(existingItem);
        _cartItems[index] = updatedItem;
      } else {
        // Product doesn't exist, add to cart
        _cartItems.add(
          CartItemViewModel(
            product: product,
            cartItem: CartItem(quantity: quantity),
          ),
        );
      }
      state = AsyncData(_cartItems);
      await _cartRepository.addProductToCart(
        _cartId,
        product.productId!,
        quantity,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeProductFromCart(int productId) async {
    try {
      _cartItems.removeWhere((item) => item.product.productId == productId);
      state = AsyncData(_cartItems);
      await _cartRepository.removeProductFromCart(_cartId, productId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProductQuantity(
    int productId,
    int quantity,
  ) async {
    try {
      await _cartRepository.updateProductQuantity(_cartId, productId, quantity);
      // Refresh cart items
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addMultipleProductsToCart(
    List<Product> products,
  ) async {
    try {
      await _cartRepository.addMultipleProductsToCart(_cartId, products);
      // Refresh cart items
      await fetchCartItems();
    } catch (e) {
      rethrow;
    }
  }
}
