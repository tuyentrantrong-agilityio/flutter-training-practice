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
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                l10n.welcome,
                style: textTheme.bodySmall?.copyWith(fontSize: 24, height: 1.8),
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
                    InputField(label: l10n.name),
                    const SizedBox(height: 30),
                    InputField(label: l10n.email),
                    const SizedBox(height: 30),
                    InputField(label: l10n.password),
                    const SizedBox(height: 30),
                    InputField(label: l10n.confirmPassword),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 30,
                      ),
                      child: ShoppingButton(
                        text: l10n.signUp,
                        onPressed: () => context.pushRoute(const HomeRoute()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.alreadyHaveAccount,
                          style: textTheme.labelSmall
                              ?.copyWith(fontWeight: AppFontWeights.semiBold),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => context.pushRoute(const LogInRoute()),
                          child: Text(
                            l10n.signIn,
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: AppFontWeights.bold,
                              color: AppColors.gray900,
                            ),
                          ),
                        ),
                      ],
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
