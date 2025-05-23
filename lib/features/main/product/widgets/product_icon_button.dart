import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';

class ProductIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const ProductIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor = Colors.black,
    this.backgroundColor = AppColors.lightGrey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(18),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
