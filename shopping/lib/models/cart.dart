import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  factory Cart({
    @JsonKey(name: 'cart_id') required int cartId,
    @JsonKey(name: 'user_id') required int userId,
    required List<CartItem> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
