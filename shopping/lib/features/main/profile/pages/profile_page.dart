import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/providers/auth_provider.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';

import '../../../../router/app_router.gr.dart';
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
          Consumer(
            builder: (context, ref, child) {
              return HeaderWidget(
                leftIcon: Icons.search_outlined,
                onLeftFunction: () => {},
                title: l10n.profile,
                rightIcon: Icons.logout_outlined,
                onRightFunction: () {
                  ref.read(authNotifierProvider.notifier).signOut();
                  context.router.popAndPush(const OnboardingRoute());
                },
              );
            },
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
