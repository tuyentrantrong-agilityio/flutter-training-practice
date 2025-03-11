import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.g.dart';
part 'favorite.freezed.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    @JsonKey(name: 'favorite_id') int? favoriteId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'added_at') required DateTime addedAt,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
