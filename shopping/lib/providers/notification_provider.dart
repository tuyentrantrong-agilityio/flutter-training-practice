import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/notification.dart' as model;
import '../repositories/notification_repository.dart';
import '../services/storage/storage.dart';
import 'repository_provider.dart';

part 'notification_provider.g.dart';

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  late final NotificationRepository _notificationRepository;
  late String _userId;
  late List<model.Notification> _notifications;

  @override
  Future<List<model.Notification>> build() async {
    _userId = UserStorage.getUserId();
    _notificationRepository = ref.read(notificationServiceProvider);
    return _notifications =
        await _notificationRepository.getNotificationsByUserId(_userId);
  }

  Future<void> fetchNotifications() async {
    try {
      _notifications = await _notificationRepository
          .getNotificationsByUserId(UserStorage.getUserId());
      state = AsyncData(_notifications);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addNotification(String title, String message) async {
    try {
      final newNotification = model.Notification(
        userId: _userId,
        title: title,
        message: message,
      );
      _notifications = [..._notifications, newNotification];
      state = AsyncData(_notifications);

      await _notificationRepository.insertNotification(
        _userId,
        title,
        message,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateNotificationReadStatus(
    int notificationId,
  ) async {
    try {
      final index =
          _notifications.indexWhere((n) => n.notificationId == notificationId);
      if (index != -1) {
        final updatedNotification =
            _notifications[index].copyWith(isRead: true);
        _notifications[index] = updatedNotification;
        state = AsyncData(_notifications);
      }

      await _notificationRepository.updateIsRead(notificationId);
    } catch (e) {
      rethrow;
    }
  }
}
