import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    @JsonKey(name: 'profile_id') int? profileId,
    @JsonKey(name: 'user_id') required String userId,
    String? name,
    String? phoneNumber,
    String? address,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    String? profilePicture,
    @JsonKey(name: 'fcm_Token') String? fcmToken,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
