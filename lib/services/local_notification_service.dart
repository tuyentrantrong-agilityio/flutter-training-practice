import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Show a local notification with the given id, title, and body.
  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      icon: '@mipmap/ic_launcher',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      sound: RawResourceAndroidNotificationSound('notification'),
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: androidNotificationDetails,
      ),
    );
  }
}
