import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping/providers/repository_provider.dart';
import '../models/cart_item_viewmodel.dart';
import '../repositories/order_repository.dart';
import '../services/storage/storage.dart';

part 'order_provider.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  late final OrderRepository _orderRepository;
  late String _userId;

  @override
  Future<void> build() async {
    _userId = UserStorage.getUserId();
    _orderRepository = ref.read(orderServiceProvider);
  }

  Future<void> createOrder({
    required double total,
    required List<CartItemViewModel> cartItemList,
  }) async {
    await _orderRepository.createOrder(
      userId: _userId,
      total: total,
      cartItemList: cartItemList,
    );
  }
}
