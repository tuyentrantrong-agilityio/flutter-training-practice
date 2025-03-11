import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';

import '../../../../shared/widgets/widget.dart';
import '../widgets/profile_card.dart';
import '../widgets/profile_section.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.intl;
    return MainLayout(
      body: Column(
        children: [
          HeaderWidget(
            leftIcon: Icons.search_outlined,
            onLeftFunction: () => {},
            title: l10n.profile,
            rightIcon: Icons.logout_outlined,
            onRightFunction: () => {},
          ),
          const ProfileSection(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: const [
                ProfileCard(
                  title: 'My orders',
                  description: 'Already have 10 orders',
                ),
                SizedBox(height: 10),
                ProfileCard(
                  title: 'My orders',
                  description: 'Already have 10 orders',
                ),
                SizedBox(height: 10),
                ProfileCard(
                  title: 'My orders',
                  description: 'Already have 10 orders',
                ),
                SizedBox(height: 10),
                ProfileCard(
                  title: 'My orders',
                  description: 'Already have 10 orders',
                ),
                SizedBox(height: 10),
                ProfileCard(
                  title: 'My orders',
                  description: 'Already have 10 orders',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
