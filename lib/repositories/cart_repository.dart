import '../models/cart_item_viewmodel.dart';
import '../services/cart_service.dart';

abstract class CartRepository {
  Future<int> getCartId(String userId);
  Future<int> createCart(String userId);
  Future<List<CartItemViewModel>> getCartItemsWithProductDetails(int cardId);
  Future<void> addProductToCart(int cartId, int productId, int quantity);
  Future<void> removeProductFromCart(int cartId, int productId);
  Future<void> updateProductQuantity(
    int cartId,
    int productId,
    int quantity,
  );
}

class CartRepositoryImpl implements CartRepository {
  final CartService _cartService;

  CartRepositoryImpl(this._cartService);

  @override
  Future<int> createCart(
    String userId,
  ) async {
    return _cartService.createCart(userId);
  }

  @override
  Future<int> getCartId(
    String userId,
  ) async {
    return _cartService.getCartId(userId);
  }

  @override
  Future<List<CartItemViewModel>> getCartItemsWithProductDetails(
    int cartId,
  ) async {
    return _cartService.getCartItemsWithProductDetails(cartId);
  }

  @override
  Future<void> addProductToCart(
    int cartId,
    int productId,
    int quantity,
  ) async {
    await _cartService.addProductToCart(cartId, productId, quantity);
  }

  @override
  Future<void> removeProductFromCart(int cartId, int productId) async {
    await _cartService.removeProductFromCart(cartId, productId);
  }

  @override
  Future<void> updateProductQuantity(
    int cartId,
    int productId,
    int quantity,
  ) async {
    await _cartService.updateProductQuantity(cartId, productId, quantity);
  }
}
