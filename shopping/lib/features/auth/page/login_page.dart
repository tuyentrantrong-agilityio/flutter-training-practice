import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../l10n/app_localizations.dart';
import '../../../providers/auth_provider.dart';
import '../../../router/app_router.gr.dart';
import '../../../shared/widgets/widget.dart';
import '../../../theme/theme.dart';
import '../widgets/auth_form.dart';
import '../widgets/header_image.dart';
import '../widgets/input_field.dart';

@RoutePage()
class LogInPage extends HookConsumerWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    void signIn() {
      if (formKey.currentState?.validate() ?? false) {
        isLoading.value = true;
        ref
            .read(authNotifierProvider.notifier)
            .signIn(
              emailController.text,
              passwordController.text,
            )
            .then((_) {
          isLoading.value = false;
          if (!context.mounted) return;
          context.pushRoute(const GuardRoute());
        }).catchError((error) {
          if (!context.mounted) return;
          context.showTextSnackBar(error.message);
          isLoading.value = false;
        });
      }
    }

    return MainLayout(
      body: Form(
        key: formKey,
        child: Column(
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
                  InputField(
                    label: l10n.email,
                    child: ShoppingTextInput.email(
                      context,
                      controller: emailController,
                    ),
                  ),
                  context.sizedBox(height: 30),
                  InputField(
                    label: l10n.password,
                    child: ShoppingTextInput.password(
                      context,
                      controller: passwordController,
                      validator: (value) => value?.validatePassword(context),
                    ),
                  ),
                  context.sizedBox(height: 30),
                  Text(
                    l10n.forgotPassword,
                    style: textTheme.labelMedium,
                  ),
                  Padding(
                    padding: context.padding(vertical: 30, right: 30),
                    child: ShoppingButton(
                      text: l10n.login,
                      isLoading: isLoading.value,
                      onPressed: () => isLoading.value ? null : signIn(),
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
      ),
    );
  }
}
