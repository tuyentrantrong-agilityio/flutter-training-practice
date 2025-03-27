import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../theme/theme.dart';

class AuthForm extends StatelessWidget {
  final Widget child;
  const AuthForm({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(right: 30),
      child: Container(
        padding: context.padding(left: 30, top: 30),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.greenBlue50,
              blurRadius: 30,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
