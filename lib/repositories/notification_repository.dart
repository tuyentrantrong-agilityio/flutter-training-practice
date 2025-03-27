import '../models/notification.dart' as model;
import '../services/notification_service.dart';

abstract class NotificationRepository {
  Future<void> insertNotification(
    String userId,
    String title,
    String message,
  );
  Future<List<model.Notification>> getNotificationsByUserId(String userId);
  Future<void> updateIsRead(int notificationId);
}

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationService _notificationService;

  NotificationRepositoryImpl(this._notificationService);

  @override
  Future<void> insertNotification(
    String userId,
    String title,
    String message,
  ) async {
    await _notificationService.insertNotification(userId, title, message);
  }

  @override
  Future<List<model.Notification>> getNotificationsByUserId(
    String userId,
  ) async {
    return _notificationService.getNotifications(userId);
  }

  @override
  Future<void> updateIsRead(int notificationId) async {
    return _notificationService.updateIsRead(notificationId);
  }
}
