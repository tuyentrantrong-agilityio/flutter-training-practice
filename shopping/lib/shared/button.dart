import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// A customizable button widget for the Lotus app.
class ShoppingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double borderRadius;

  const ShoppingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 8.0,
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
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.white,
                fontWeight: AppFontWeights.semiBold,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
