import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/cart_item_viewmodel.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../shared/widgets/widget.dart';

@RoutePage()
class CartPage extends HookConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.intl;
    final asyncListProduct = ref.watch(cartNotifierProvider);
    final cartItemList = useState<List<CartItemViewModel>>([]);
    return MainLayout(
      body: Column(
        children: [
          HeaderWidget(
            leftIcon: Icons.arrow_back_ios,
            onLeftFunction: () => context.router.popForced(),
            title: l10n.myCart,
          ),
          asyncListProduct.when(
            data: (data) {
              return Expanded(
                child: ListView.separated(
                  controller: ScrollController(),
                  padding: const EdgeInsets.all(16.0),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      cartItemList.value = data;
                    });

                    final cartItemViewModel = data[index];
                    final cartItem = cartItemViewModel.cartItem;

                    return ProductCard(
                      product: cartItemViewModel.product,
                      quantity: cartItem.quantity,
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
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
              onPressed: () {
                // FIXME: Need to improve function in the future
                if (cartItemList.value != []) {}
              },
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
