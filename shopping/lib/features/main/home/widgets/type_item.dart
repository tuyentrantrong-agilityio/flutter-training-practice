import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';

class TypeItem extends StatelessWidget {
  final Widget child;
  final bool active;
  const TypeItem({
    super.key,
    required this.child,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: ShapeDecoration(
        color: active ? AppColors.gray700 : AppColors.white100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
