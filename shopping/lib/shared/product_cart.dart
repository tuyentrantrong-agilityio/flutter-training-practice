import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';
import 'package:shopping/utils/extensions/double_extension.dart';

import '../../../../theme/theme.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String type;
  final double cost;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.type,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;

    return SizedBox(
      width: 157,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 157,
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/images/add_cart.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: textTheme.labelSmall?.copyWith(color: AppColors.gray600),
          ),
          const SizedBox(height: 4),
          Text(
            cost.toCurrencyFormat,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: AppFontWeights.bold,
              color: AppColors.gray900,
            ),
          ),
        ],
      ),
    );
  }
}