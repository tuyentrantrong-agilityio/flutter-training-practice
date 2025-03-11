import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/shared/widgets/product_quantity_section.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';
import 'package:shopping/utils/extensions/double_extension.dart';

import '../../../../../theme/theme.dart';
import '../../router/app_router.gr.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int? quantity;
  final double price;
  final int inventoryQuantity;

  const ProductCard({
    super.key,
    required this.name,
    required this.imageUrl,
    this.quantity,
    required this.price,
    required this.inventoryQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final isCartPage = context.router.current.name == CartRoute.name;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textTheme.labelSmall
                        ?.copyWith(color: AppColors.gray600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price.toCurrencyFormat,
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.gray900,
                    ),
                  ),
                  const Spacer(),
                  if (isCartPage)
                    ProductQuantitySection(
                      quantity: quantity ?? 1,
                      inventoryQuantity: inventoryQuantity,
                    ),
                ],
              ),
            ),
            Column(
              children: [
                const Icon(
                  Icons.cancel_outlined,
                  color: AppColors.gray500,
                ),
                const Spacer(),
                if (!isCartPage)
                  SvgPicture.asset(
                    'assets/images/add_cart.svg',
                    width: 25,
                    height: 25,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
