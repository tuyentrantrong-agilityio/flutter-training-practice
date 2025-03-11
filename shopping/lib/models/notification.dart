import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.g.dart';
part 'notification.freezed.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    @JsonKey(name: 'notification_id') int? notificationId,
    @JsonKey(name: 'user_id') required int userId,
    required String title,
    required String message,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
