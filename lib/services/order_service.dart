import 'package:shopping/services/supabase_init.dart';
import '../models/cart_item_viewmodel.dart';

class OrderService {
  Future<void> createOrder({
    required String userId,
    required double total,
    required List<CartItemViewModel> cartItemList,
  }) async {
    try {
      final orderResponse = await supabaseClient
          .from('orders')
          .insert({
            'user_id': userId,
            'total': total,
            'status': 'Pending',
          })
          .select('order_id')
          .single();

      final orderId = orderResponse['order_id'] as int;

      final orderItems = cartItemList.map((cartItem) {
        return {
          'order_id': orderId,
          'product_id': cartItem.product.productId,
          'quantity': cartItem.quantity,
          'price': cartItem.product.price,
        };
      }).toList();
      await supabaseClient.from('order_items').insert(orderItems);
    } catch (error) {
      rethrow;
    }
  }
}
