import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../l10n/app_localizations.dart';
import '../../../router/app_router.gr.dart';
import '../../../shared/button.dart';
import '../../../theme/theme.dart';
import '../widgets/header_image.dart';
import '../widgets/input_field.dart';

@RoutePage()
class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage(),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.hello,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 30,
                      fontWeight: AppFontWeights.regular,
                      height: 1.5,
                      color: AppColors.gray400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.welcomeBack,
                    style: textTheme.bodySmall
                        ?.copyWith(fontSize: 24, height: 1.8),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                padding: const EdgeInsets.only(left: 30, top: 30),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x338A959E),
                      blurRadius: 30,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    InputField(label: l10n.email),
                    const SizedBox(height: 40),
                    InputField(label: l10n.password),
                    const SizedBox(height: 40),
                    Text(
                      l10n.forgotPassword,
                      style: textTheme.labelMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 30,
                      ),
                      child: ShoppingButton(
                        text: l10n.login,
                        onPressed: () => context.pushRoute(const GuardRoute()),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.pushRoute(const SignUpRoute()),
                      child: Text(
                        l10n.signUp,
                        style: textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
