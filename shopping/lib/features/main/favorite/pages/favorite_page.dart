import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
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
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: const [
                ProductCard(
                  name: 'Coffee Table',
                  imageUrl: 'assets/images/product_image.png',
                  price: 50.00,
                  inventoryQuantity: 5,
                ),
                SizedBox(height: 10),
                Divider(color: Color(0xFFF0F0F0), height: 1),
                SizedBox(height: 10),
                ProductCard(
                  name: 'Coffee Chair',
                  imageUrl: 'assets/images/product_image.png',
                  price: 20.00,
                  inventoryQuantity: 10,
                ),
                SizedBox(height: 10),
                Divider(color: Color(0xFFF0F0F0), height: 1),
                SizedBox(height: 10),
                ProductCard(
                  name: 'Minimal Stand',
                  imageUrl: 'assets/images/product_image.png',
                  price: 25.00,
                  inventoryQuantity: 15,
                ),
                SizedBox(height: 10),
                Divider(color: Color(0xFFF0F0F0), height: 1),
                SizedBox(height: 10),
                ProductCard(
                  name: 'Minimal Desk',
                  imageUrl: 'assets/images/product_image.png',
                  price: 50.00,
                  inventoryQuantity: 20,
                ),
                SizedBox(height: 10),
                Divider(color: Color(0xFFF0F0F0), height: 1),
                SizedBox(height: 10),
                ProductCard(
                  name: 'Minimal Desk',
                  imageUrl: 'assets/images/product_image.png',
                  price: 50.00,
                  inventoryQuantity: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
