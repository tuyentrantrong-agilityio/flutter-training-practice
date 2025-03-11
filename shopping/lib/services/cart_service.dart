import '../models/cart_item.dart';
import '../models/cart_item_viewmodel.dart';
import '../models/product.dart';
import 'supabase_init.dart';

class CartService {
  Future<List<CartItemViewModel>> getCartItemsWithProductDetails(
    String cartId,
  ) async {
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
  }
}
