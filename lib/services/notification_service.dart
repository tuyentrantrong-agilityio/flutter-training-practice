import 'package:flutter/material.dart';

import '../models/notification.dart' as model;
import 'supabase_init.dart';

class NotificationService {
  Future<void> insertNotification(
    String userId,
    String title,
    String message,
  ) async {
    try {
      await supabaseClient.from('notifications').insert({
        'user_id': userId,
        'title': title,
        'message': message,
      });
    } catch (e) {
      debugPrint('Exception occurred: $e');
      rethrow;
    }
  }

  Future<List<model.Notification>> getNotifications(String userId) async {
    try {
      final response = await supabaseClient
          .from('notifications')
          .select()
          .eq('user_id', userId)
          .order('is_read', ascending: true)
          .order('created_at', ascending: false)
          .limit(10);

      return (response as List)
          .map((json) => model.Notification.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Exception occurred: $e');
      rethrow;
    }
  }

  Future<void> updateIsRead(int notificationId) async {
    try {
      await supabaseClient
          .from('notifications')
          .update({'is_read': true}).eq('notification_id', notificationId);
    } catch (e) {
      debugPrint('Exception occurred while updating isRead: $e');
      rethrow;
    }
  }
}
