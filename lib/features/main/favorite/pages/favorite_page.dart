import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/product.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../providers/favorite_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/widgets/widget.dart';

@RoutePage()
class FavoritePage extends HookConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.intl;
    final asyncListProduct = ref.watch(favoriteNotifierProvider);
    final productList = useState<List<Product>>([]);
    final isLoading = useState(false);

    return MainLayout(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ShoppingButton(
          text: l10n.addAllToMyCart,
          isLoading: isLoading.value,
          onPressed: isLoading.value
              ? null
              : () async {
                  if (productList.value != []) {
                    isLoading.value = true;
                    await ref
                        .watch(cartNotifierProvider.notifier)
                        .addMultipleProductsToCart(productList.value);
                    if (!context.mounted) return;
                    isLoading.value = false;
                    context.router.popAndPush(const CartRoute());
                  }
                },
          height: 60,
        ),
      ),
      body: Column(
        children: [
          HeaderWidget(
            leftIcon: Icons.search_outlined,
            onLeftFunction: () => {},
            title: l10n.favorites,
            rightIcon: Icons.shopping_cart_outlined,
            onRightFunction: () => context.pushRoute(const CartRoute()),
          ),
          Expanded(
            child: asyncListProduct.when(
              data: (products) {
                productList.value = products;
                return ListView.separated(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                );
              },
              error: (_, __) => const SizedBox.shrink(),
              loading: () => const ShimmerLoading(),
            ),
          ),
        ],
      ),
    );
  }
}
