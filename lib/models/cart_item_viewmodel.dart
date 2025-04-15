import 'package:freezed_annotation/freezed_annotation.dart';
import 'product.dart';

part 'cart_item_viewmodel.g.dart';
part 'cart_item_viewmodel.freezed.dart';

@freezed
class CartItemViewModel with _$CartItemViewModel {
  const factory CartItemViewModel({
    required int quantity,
    required Product product,
  }) = _CartItemViewModel;

  factory CartItemViewModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemViewModelFromJson(json);
}
