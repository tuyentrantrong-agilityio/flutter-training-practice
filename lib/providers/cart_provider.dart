import 'dart:math';

import 'package:cached_query/cached_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping/providers/repository_provider.dart';
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
    final data = await getCachedData();
    _cartItems = data;
    return data;
  }

  Future<List<CartItemViewModel>> getCachedData() async {
    final query = Query<List<CartItemViewModel>>(
      key: "cart_items_$_cartId",
      queryFn: () => _cartRepository.getCartItemsWithProductDetails(_cartId),
    );
    final queryState = await query.result;
    return queryState.data ?? [];
  }

  CartItemViewModel? findCartItem(int productId) {
    try {
      return _cartItems
          .firstWhere((item) => item.product.productId == productId);
    } catch (e) {
      return null;
    }
  }

  Future<void> addProductToCart({
    bool isUpdate = false,
    required Product product,
    required int quantity,
  }) async {
    try {
      // Ensure the state has finished loading before proceeding
      if (state is AsyncLoading) {
        await future;
      }

      // Find the index of the product in the cart (if it already exists)
      final existingIndex = _cartItems
          .indexWhere((item) => item.product.productId == product.productId);

      if (existingIndex != -1) {
        // Product already exists in the cart
        final currentQuantity = _cartItems[existingIndex].quantity;

        // If not updating and already at max stock, do nothing
        if (currentQuantity >= product.stock && !isUpdate) return;

        // Calculate the maximum allowed quantity (cannot exceed stock)
        final maxQuantity = min(currentQuantity + quantity, product.stock);

        // Update cart item: use 'quantity' if updating, otherwise use calculated maxQuantity
        _cartItems[existingIndex] = CartItemViewModel(
          quantity: isUpdate ? quantity : maxQuantity,
          product: product,
        );
      } else {
        // Product does not exist in cart, add as a new item
        _cartItems.add(
          CartItemViewModel(
            product: product,
            quantity: quantity,
          ),
        );
      }

      // Update the cart state
      state = AsyncData(_cartItems);

      // Call API to persist the update on the server
      if (isUpdate) {
        await updateProductQuantity(product.productId!, quantity);
      } else {
        await _cartRepository.addProductToCart(
          _cartId,
          product.productId!,
          quantity,
        );
      }

      // Invalidate cached cart data so it can be refreshed
      CachedQuery.instance.invalidateCache(key: "cart_items_$_cartId");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProductQuantity(
    int productId,
    int quantity,
  ) async {
    await _cartRepository.updateProductQuantity(_cartId, productId, quantity);
    CachedQuery.instance.invalidateCache(key: "cart_items_$_cartId");
  }

  Future<void> removeProductFromCart(int productId) async {
    try {
      _cartItems.removeWhere((item) => item.product.productId == productId);
      state = AsyncData(_cartItems);
      await _cartRepository.removeProductFromCart(_cartId, productId);
      CachedQuery.instance.invalidateCache(key: "cart_items_$_cartId");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addMultipleProductsToCart(
    List<Product> products,
  ) async {
    try {
      for (final product in products) {
        await addProductToCart(product: product, quantity: 1);
      }
    } catch (e) {
      rethrow;
    }
  }
}
