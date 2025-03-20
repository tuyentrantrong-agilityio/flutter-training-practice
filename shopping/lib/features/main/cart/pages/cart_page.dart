import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/widgets/widget.dart';

@RoutePage()
class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.intl;
    final asyncListProduct = ref.watch(cartNotifierProvider);
    return MainLayout(
      body: Column(
        children: [
          HeaderWidget(
            leftIcon: Icons.arrow_back_ios,
            onLeftFunction: () => Navigator.pop(context),
            title: l10n.myCart,
          ),
          asyncListProduct.when(
            data: (data) {
              return Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cartItemViewModel = data[index];
                    final cartItem = cartItemViewModel.cartItem;

                    return ProductCard(
                      product: cartItemViewModel.product,
                      quantity: cartItem.quantity,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              );
            },
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const ShimmerLoading(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ShoppingButton(
              text: l10n.checkOut,
              onPressed: () => context.pushRoute(const LogInRoute()),
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
