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
class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final passwordConfirmController = useTextEditingController();

    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    void signUp() {
      if (formKey.currentState?.validate() ?? false) {
        isLoading.value = true;
        ref
            .read(authNotifierProvider.notifier)
            .signUp(
              emailController.text,
              passwordController.text,
              nameController.text,
            )
            .then((result) {
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
      hasScrollView: true,
      scrollController: ScrollController(),
      body: Form(
        key: formKey,
        child: Column(
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
                  InputField(
                    label: l10n.name,
                    child: ShoppingTextInput.name(
                      context,
                      controller: nameController,
                    ),
                  ),
                  context.sizedBox(height: 30),
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
                  InputField(
                    label: l10n.confirmPassword,
                    child: ShoppingTextInput.password(
                      context,
                      controller: passwordConfirmController,
                      validator: (value) => value?.validatePasswordConfirm(
                        context,
                        passwordController.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding: context.padding(vertical: 30, right: 30),
                    child: ShoppingButton(
                      text: l10n.signUp,
                      isLoading: isLoading.value,
                      onPressed: () => isLoading.value ? null : signUp(),
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
      ),
    );
  }
}
