import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../providers/favorite_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/widgets/widget.dart';

@RoutePage()
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.intl;

    return MainLayout(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ShoppingButton(
          text: l10n.addAllToMyCart,
          onPressed: () => context.pushRoute(const LogInRoute()),
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
            child: Consumer(
              builder: (_, ref, __) {
                final asyncListProduct = ref.watch(favoriteNotifierProvider);
                return asyncListProduct.when(
                  data: (products) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16.0),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          productId: product.productId!,
                          name: product.name,
                          imageUrl: product.imageUrl!,
                          price: product.price,
                          inventoryQuantity: product.stock,
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(),
                    );
                  },
                  error: (_, __) => const SizedBox.shrink(),
                  loading: () => const ShimmerLoading(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
