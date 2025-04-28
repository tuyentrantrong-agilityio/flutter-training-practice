import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../const/const.dart';
import '../../../../models/product.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../theme/theme.dart';

class OverviewCard extends StatelessWidget {
  final Product product;

  const OverviewCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final labelSmall = textTheme.labelSmall;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 167,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl!),
                fit: BoxFit.contain,
              ),
            ),
            child: Consumer(
              builder: (context, ref, child) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      ref
                          .watch(cartNotifierProvider.notifier)
                          .addProductToCart(product: product, quantity: 1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppConst.addCartImage,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: labelSmall?.copyWith(color: AppColors.gray600),
          ),
          const SizedBox(height: 4),
          Text(
            product.price.toCurrencyFormat,
            style: labelSmall?.copyWith(
              fontWeight: AppFontWeights.bold,
              color: AppColors.gray900,
            ),
          ),
        ],
      ),
    );
  }
}
