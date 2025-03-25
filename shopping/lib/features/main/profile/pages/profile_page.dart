import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/providers/auth_provider.dart';
import 'package:shopping/utils/extensions/extension.dart';

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
    final List<Map<String, dynamic>> profileOptions = [
      {
        'title': l10n.myOrders,
        'description': l10n.myOrdersDescription(2),
      },
      {
        'title': l10n.shippingAddresses,
        'description': l10n.shippingAddressesDescription(2),
      },
      {
        'title': l10n.paymentMethod,
        'description': l10n.paymentMethodDescription(2),
      },
      {
        'title': l10n.myReviews,
        'description': l10n.myReviewsDescription(2),
      },
      {
        'title': l10n.settings,
        'description': l10n.settingsDescription,
      },
    ];
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
          SizedBox(
            height: context.sizeHeight(30),
          ),
          Expanded(
            child: ListView.separated(
              controller: ScrollController(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: profileOptions.length,
              itemBuilder: (context, index) {
                final option = profileOptions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ProfileCard(
                    title: option['title'],
                    description: option['description'],
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
