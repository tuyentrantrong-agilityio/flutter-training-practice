import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/product.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../providers/product_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/widgets/widget.dart';
import '../../../../theme/theme.dart';
import '../widgets/product_image_section.dart';
import '../widgets/product_info_section.dart';

@RoutePage()
class ProductPage extends HookConsumerWidget {
  final int productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.intl;
    final quantity = useState(1);
    // Use useMemoized to prevent unnecessary rebuilds
    final asyncProduct = useMemoized(
      () =>
          ref.read(productNotifierProvider.notifier).getProductById(productId),
      [productId],
    );

    return MainLayout(
      body: FutureBuilder<Product>(
        future: asyncProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const SizedBox();
            } else {
              final product = snapshot.data!;
              return Column(
                children: [
                  ProductImageSection(imageUrl: product.imageUrl!),
                  ProductInfoSection(product: product, quantity: quantity),
                  Padding(
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
                        Expanded(
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }
          } else {
            return const ShimmerLoading();
          }
        },
      ),
    );
  }
}
