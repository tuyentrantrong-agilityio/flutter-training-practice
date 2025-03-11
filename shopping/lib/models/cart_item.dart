import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.g.dart';
part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(name: 'cart_item_id') int? cartItemId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'product_id') required int productId,
    required int quantity,
    @JsonKey(name: 'added_at') required DateTime addedAt,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
