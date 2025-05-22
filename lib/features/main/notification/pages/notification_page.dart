import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../providers/notification_provider.dart';
import '../../../../shared/widgets/widget.dart';
import '../widgets/notification_item.dart';

@RoutePage()
class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.intl;
    final notifications = ref.watch(notificationNotifierProvider);

    return MainLayout(
      body: Column(
        children: [
          HeaderWidget(
            leftIcon: Icons.search_outlined,
            onLeftFunction: () => {},
            title: l10n.notification,
          ),
          Expanded(
            child: notifications.when(
              data: (notificationList) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    final notification = notificationList[index];
                    return NotificationItem(
                      key: ValueKey(notification.notificationId),
                      title: notification.title ?? '',
                      description: notification.message ?? '',
                      isRead: notification.isRead,
                      onTap: () async {
                        await ref
                            .read(notificationNotifierProvider.notifier)
                            .updateNotificationReadStatus(
                              notification.notificationId!,
                            );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                );
              },
              error: (_, __) => const SizedBox.shrink(),
              loading: () => const ShimmerLoading(),
            ),
          ),
        ],
      ),
    );
  }
}
