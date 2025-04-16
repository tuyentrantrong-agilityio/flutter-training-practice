import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/cart_item_viewmodel.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../providers/order_provider.dart';
import '../../../../shared/widgets/widget.dart';
import '../widgets/promo_code_field.dart';
import '../widgets/total_amount_display.dart';

@RoutePage()
class CartPage extends HookConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.intl;
    final asyncListProduct = ref.watch(cartNotifierProvider);
    final cartItemList = useState<List<CartItemViewModel>>([]);
    final totalAmount = useState<double>(0.0);
    final isLoading = useState(false);

    Future<void> _checkout() async {
      isLoading.value = true;
      await ref
          .watch(orderNotifierProvider.notifier)
          .createOrder(
            total: totalAmount.value,
            cartItemList: cartItemList.value,
          )
          .then((_) {
        isLoading.value = false;
      });
    }

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
              cartItemList.value = data;
              totalAmount.value = data.fold(
                0.0,
                (sum, item) => sum + (item.product.price * item.quantity),
              );

              return Expanded(
                child: ListView.separated(
                  controller: ScrollController(),
                  padding: const EdgeInsets.all(16.0),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cartItemViewModel = data[index];

                    return ProductCard(
                      product: cartItemViewModel.product,
                      quantity: cartItemViewModel.quantity,
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                ),
              );
            },
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const Expanded(child: ShimmerLoading()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                PromoCodeField(
                  controller: TextEditingController(),
                  hintText: l10n.enterPromo,
                  onArrowPressed: () {},
                ),
                TotalAmountDisplay(totalAmount: totalAmount.value),
                ShoppingButton(
                  text: l10n.checkOut,
                  isLoading: isLoading.value,
                  onPressed: isLoading.value
                      ? null
                      : () {
                          if (cartItemList.value.isNotEmpty) _checkout();
                        },
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
