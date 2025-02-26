import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/theme/app_font_weights.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../l10n/app_localizations.dart';
import '../../../router/app_router.gr.dart';
import '../../../shared/button.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.makeYour,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.homeBeautiful,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: AppFontWeights.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.onboardingDescription,
              textAlign: TextAlign.justify,
              style: textTheme.labelMedium?.copyWith(
                fontWeight: AppFontWeights.regular,
                height: 1.9,
                color: context.colorScheme.onPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 50),
              child: ShoppingButton(
                text: l10n.getStarted,
                onPressed: () => context.pushRoute(const LogInRoute()),
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
