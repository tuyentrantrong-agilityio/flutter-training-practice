import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../theme/theme.dart';

class TypeItem extends StatelessWidget {
  final Widget child;
  final String title;
  final bool active;
  const TypeItem({
    super.key,
    required this.child,
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelSmall = context.textTheme.labelSmall;
    return Column(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: ShapeDecoration(
            color: active ? AppColors.gray700 : AppColors.white100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: child,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: active
              ? labelSmall?.copyWith(
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.black100,
                )
              : labelSmall,
        ),
      ],
    );
  }
}
