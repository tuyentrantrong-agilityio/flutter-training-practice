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
class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;

    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderImage(),
          context.sizedBox(height: 40),
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
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 24,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
          context.sizedBox(height: 40),
          AuthForm(
            child: Column(
              children: [
                InputField(label: l10n.email),
                context.sizedBox(height: 30),
                InputField(label: l10n.password),
                context.sizedBox(height: 30),
                Text(
                  l10n.forgotPassword,
                  style: textTheme.labelMedium,
                ),
                Padding(
                  padding: context.padding(vertical: 30, right: 30),
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
                context.sizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
