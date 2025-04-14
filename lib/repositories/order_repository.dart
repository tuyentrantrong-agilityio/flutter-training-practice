import '../models/cart_item_viewmodel.dart';
import '../services/order_service.dart';

abstract class OrderRepository {
  Future<void> createOrder({
    required String userId,
    required double total,
    required List<CartItemViewModel> cartItemList,
  });
}

class OrderRepositoryImpl implements OrderRepository {
  final OrderService _orderService;

  OrderRepositoryImpl(this._orderService);

  @override
  Future<void> createOrder({
    required String userId,
    required double total,
    required List<CartItemViewModel> cartItemList,
  }) async {
    return _orderService.createOrder(
      userId: userId,
      total: total,
      cartItemList: cartItemList,
    );
  }
}
