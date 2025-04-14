import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../theme/theme.dart';

class TotalAmountDisplay extends StatelessWidget {
  final double totalAmount;

  const TotalAmountDisplay({
    super.key,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final labelMedium = textTheme.labelMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.intl.total,
            style: labelMedium?.copyWith(
              color: AppColors.gray500,
            ),
          ),
          Text(
            totalAmount.toCurrencyFormat,
            textAlign: TextAlign.right,
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
