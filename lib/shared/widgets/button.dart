import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../theme/theme.dart';

/// A customizable button widget for the Lotus app.
class ShoppingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool isLoading;

  const ShoppingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColors.white,
              )
            : Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: AppFontWeights.semiBold,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
