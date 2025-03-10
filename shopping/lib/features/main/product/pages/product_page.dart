import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/product.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/widgets/widget.dart';
import '../../../../theme/theme.dart';

@RoutePage()
class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;
    return MainLayout(
      body: Column(
        children: [
          Container(
            height: 455,
            margin: const EdgeInsets.only(left: 52),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
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
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 30,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                    const Spacer(),
                    ProductQuantitySection(inventoryQuantity: product.stock),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    const SizedBox(width: 10),
                    Text(
                      '4.5',
                      style: textTheme.labelMedium
                          ?.copyWith(fontWeight: AppFontWeights.bold),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '(50 reviews)',
                      style: textTheme.labelSmall?.copyWith(
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
                  style: textTheme.labelSmall?.copyWith(
                    color: AppColors.gray600,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () => context.pushRoute(const FavoriteRoute()),
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(18),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF0F0F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(
                      Icons.bookmark_border_sharp,
                      color: AppColors.black100,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ShoppingButton(
                    text: l10n.addToCart,
                    onPressed: () => context.pushRoute(const CartRoute()),
                    height: 60,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
