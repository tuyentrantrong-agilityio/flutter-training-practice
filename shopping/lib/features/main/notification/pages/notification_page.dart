import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/widget.dart';
import '../widgets/notification_item.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.intl;
    return MainLayout(
      body: Column(
        children: [
          HeaderWidget(
            leftIcon: Icons.search_outlined,
            onLeftFunction: () => {},
            title: l10n.notification,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                NotificationItem(
                  title: 'Your order #123456789 has been confirmed',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
                ),
                SizedBox(height: 10),
                NotificationItem(
                  title: 'Your order #123456789 has been confirmed',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
                ),
                SizedBox(height: 10),
                NotificationItem(
                  title: 'Your order #123456789 has been confirmed',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
                ),
                SizedBox(height: 10),
                NotificationItem(
                  title: 'Your order #123456789 has been confirmed',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
