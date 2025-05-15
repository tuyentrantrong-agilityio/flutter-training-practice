import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';
import '../../../../models/product.dart';
import '../../../../shared/widgets/widget.dart';
import '../../../../theme/theme.dart';

class ProductInfoSection extends StatelessWidget {
  final Product product;
  final ValueNotifier<int> quantity;
  const ProductInfoSection({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final labelMedium = textTheme.labelMedium;
    final labelSmall = textTheme.labelSmall;

    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  product.price.toCurrencyFormat,
                  style: labelMedium?.copyWith(
                    fontSize: 30,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
                const Spacer(),
                ProductQuantitySection(
                  inventoryQuantity: product.stock,
                  quantity: quantity,
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const SizedBox(width: 10),
                Text(
                  product.rating.toString(),
                  style: labelMedium?.copyWith(fontWeight: AppFontWeights.bold),
                ),
                const SizedBox(width: 10),
                Text(
                  product.reviewsCount!.displayTotalReviews,
                  style: labelSmall?.copyWith(
                    fontWeight: AppFontWeights.semiBold,
                    color: AppColors.gray500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              product.description!,
              textAlign: TextAlign.justify,
              style: labelSmall?.copyWith(
                color: AppColors.gray600,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
