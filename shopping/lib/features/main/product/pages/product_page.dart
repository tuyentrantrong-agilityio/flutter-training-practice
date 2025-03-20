import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/product.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/widgets/widget.dart';
import '../../../../theme/theme.dart';

@RoutePage()
class ProductPage extends HookWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;
    final quantity = useState(1);

    return MainLayout(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
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
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
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
                        style: textTheme.labelMedium
                            ?.copyWith(fontWeight: AppFontWeights.bold),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        product.reviewsCount!.displayTotalReviews,
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
          ),
          Consumer(
            builder: (context, ref, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushRoute(const FavoriteRoute());
                        ref
                            .read(favoriteNotifierProvider.notifier)
                            .addFavorite(product);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(18),
                        decoration: ShapeDecoration(
                          color: AppColors.lightGrey,
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
                    Consumer(
                      builder: (context, ref, child) {
                        return Expanded(
                          child: ShoppingButton(
                            text: l10n.addToCart,
                            onPressed: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .addProductToCart(
                                    product: product,
                                    quantity: quantity.value,
                                  );
                              context.pushRoute(const CartRoute());
                            },
                            height: 60,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
