import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../l10n/app_localizations.dart';
import '../../../router/app_router.gr.dart';
import '../../../shared/widgets/widget.dart';
import '../../../theme/theme.dart';
import '../widgets/auth_form.dart';
import '../widgets/header_image.dart';
import '../widgets/input_field.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;

    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderImage(),
          context.sizedBox(height: 30),
          Padding(
            padding: context.padding(left: 30),
            child: Text(
              l10n.welcome,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 24,
                height: 1.8,
              ),
            ),
          ),
          context.sizedBox(height: 30),
          AuthForm(
            child: Column(
              children: [
                InputField(label: l10n.name),
                context.sizedBox(height: 30),
                InputField(label: l10n.email),
                context.sizedBox(height: 30),
                InputField(label: l10n.password),
                context.sizedBox(height: 30),
                InputField(label: l10n.confirmPassword),
                Padding(
                  padding: context.padding(vertical: 30, right: 30),
                  child: ShoppingButton(
                    text: l10n.signUp,
                    onPressed: () => context.pushRoute(const GuardRoute()),
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
                context.sizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
