import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.g.dart';
part 'notification.freezed.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    @JsonKey(name: 'notification_id') int? notificationId,
    @JsonKey(name: 'user_id') required String userId,
    String? title,
    String? message,
    @Default(false) @JsonKey(name: 'is_read') bool isRead,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}