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
import '../../../../services/product_share_service.dart';
import '../../../../services/storage/storage.dart';
import '../../../../shared/widgets/widget.dart';
import '../widgets/product_icon_button.dart';
import '../widgets/product_image_section.dart';
import '../widgets/product_info_section.dart';

@RoutePage()
class ProductPage extends HookConsumerWidget {
  final int productId;
  const ProductPage({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.intl;
    final userId = UserStorage.getUserId();
    final quantity = useState(1);
    final productFavorited = ref
        .watch(favoriteNotifierProvider.notifier)
        .checkFavoriteProduct(productId);

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
                        if (!productFavorited)
                          ProductIconButton(
                            icon: Icons.bookmark_border_sharp,
                            onTap: () {
                              context.pushRoute(const FavoriteRoute());
                              ref
                                  .read(favoriteNotifierProvider.notifier)
                                  .addFavorite(product);
                            },
                          ),
                        const SizedBox(width: 10),
                        ProductIconButton(
                          icon: Icons.share,
                          onTap: () => ProductShareService()
                              .shareProduct(productId, userId),
                        ),
                        const SizedBox(width: 10),
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
