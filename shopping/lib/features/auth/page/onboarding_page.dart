import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../l10n/app_localizations.dart';
import '../../../router/app_router.gr.dart';
import '../../../shared/widgets/button.dart';
import '../../../theme/theme.dart';

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
        padding: context.padding(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.sizedBox(height: 250),
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
            context.sizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                l10n.onboardingDescription,
                textAlign: TextAlign.justify,
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: AppFontWeights.regular,
                  height: 1.9,
                  color: AppColors.gray500,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: context.padding(horizontal: 80),
              child: ShoppingButton(
                text: l10n.getStarted,
                onPressed: () => context.pushRoute(const LogInRoute()),
                height: 60,
                borderRadius: 4,
              ),
            ),
            context.sizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
