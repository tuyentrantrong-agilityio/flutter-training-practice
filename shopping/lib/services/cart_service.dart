import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/cart_item_viewmodel.dart';
import '../models/product.dart';
import 'supabase_init.dart';

class CartService {
  Future<int> getCartId(
    String userId,
  ) async {
    try {
      // Get cart id
      final cartResponse = await supabaseClient
          .from('carts')
          .select('cart_id')
          .eq('user_id', userId)
          .single();
      return cartResponse['cart_id'];
    } catch (e) {
      // Handle get cart items error
      debugPrint('Get cart items error: $e');
      rethrow;
    }
  }

  Future<List<CartItemViewModel>> getCartItemsWithProductDetails(
    int cartId,
  ) async {
    try {
      final response = await supabaseClient
          .from('cart_items')
          .select('*, products(*)')
          .eq('cart_id', cartId);

      final data = response as List<dynamic>;

      return data.map((item) {
        final cartItem = CartItem.fromJson(item);
        final product = Product.fromJson(item['products']);
        return CartItemViewModel(cartItem: cartItem, product: product);
      }).toList();
    } catch (e) {
      // Handle get cart items error
      debugPrint('Get cart items error: $e');
      rethrow;
    }
  }

  Future<void> addProductToCart(
    int cartId,
    int productId,
    int quantity,
  ) async {
    try {
      final cartItem = {
        'cart_id': cartId,
        'product_id': productId,
        'quantity': quantity,
      };

      await supabaseClient.from('cart_items').insert(cartItem);
    } catch (e) {
      // Handle add product to cart error
      debugPrint('Add product to cart error: $e');
      rethrow;
    }
  }

  Future<void> removeProductFromCart(
    int cartId,
    int productId,
  ) async {
    try {
      await supabaseClient
          .from('cart_items')
          .delete()
          .eq('cart_id', cartId)
          .eq('product_id', productId);
    } catch (e) {
      // Handle remove product from cart error
      debugPrint('Remove product from cart error: $e');
      rethrow;
    }
  }

  Future<void> updateProductQuantity(
    int cartId,
    int productId,
    int quantity,
  ) async {
    try {
      await supabaseClient
          .from('cart_items')
          .update({'quantity': quantity})
          .eq('cart_id', cartId)
          .eq('product_id', productId);
    } catch (e) {
      // Handle update product quantity error
      debugPrint('Update product quantity error: $e');
      rethrow;
    }
  }
}
