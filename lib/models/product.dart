import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: 'product_id') int? productId,
    required String name,
    String? description,
    required double price,
    required int stock,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'reviews_count') int? reviewsCount,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
