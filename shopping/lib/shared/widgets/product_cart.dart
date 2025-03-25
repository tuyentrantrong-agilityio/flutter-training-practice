import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/shared/widgets/product_quantity_section.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';
import 'package:shopping/utils/extensions/double_extension.dart';

import '../../../../../theme/theme.dart';
import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../providers/favorite_provider.dart';
import '../../router/app_router.gr.dart';

class ProductCard extends HookWidget {
  final Product product;
  final int? quantity;

  const ProductCard({
    super.key,
    required this.product,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final isCartPage = useState(context.router.current.name != GuardRoute.name);
    final productId = product.productId!;
    final _quantity = useState(quantity ?? 1);

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
                  image: NetworkImage(product.imageUrl!),
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
                    product.name,
                    style: textTheme.labelSmall
                        ?.copyWith(color: AppColors.gray600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.price.toCurrencyFormat,
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.gray900,
                    ),
                  ),
                  const Spacer(),
                  if (isCartPage.value)
                    Consumer(
                      builder: (context, ref, child) {
                        return ProductQuantitySection(
                          quantity: _quantity,
                          inventoryQuantity: product.stock,
                          updateQuantity: (value) => ref
                              .read(cartNotifierProvider.notifier)
                              .addProductToCart(
                                isUpdate: true,
                                product: product,
                                quantity: value,
                              ),
                        );
                      },
                    ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: AppColors.gray500,
                      ),
                      onPressed: () {
                        isCartPage.value
                            ? ref
                                .watch(cartNotifierProvider.notifier)
                                .removeProductFromCart(productId)
                            : ref
                                .watch(favoriteNotifierProvider.notifier)
                                .removeFavorite(productId);
                      },
                    ),
                    const Spacer(),
                    if (!isCartPage.value)
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProductToCart(
                                product: product,
                                quantity: 1,
                              );
                          context.pushRoute(const CartRoute());
                        },
                        child: SvgPicture.asset(
                          'assets/images/add_cart.svg',
                          width: 25,
                          height: 25,
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
