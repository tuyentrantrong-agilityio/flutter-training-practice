import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/widgets/widget.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.intl;
    return MainLayout(
      body: Column(
        children: [
          HeaderWidget(
            leftIcon: Icons.arrow_back_ios,
            onLeftFunction: () => Navigator.pop(context),
            title: l10n.myCart,
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
                Divider(),
                SizedBox(height: 10),
                ProductCard(
                  name: 'Coffee Chair',
                  imageUrl: 'assets/images/product_image.png',
                  price: 20.00,
                  inventoryQuantity: 10,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                ProductCard(
                  name: 'Minimal Stand',
                  imageUrl: 'assets/images/product_image.png',
                  price: 25.00,
                  inventoryQuantity: 15,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                ProductCard(
                  name: 'Minimal Desk',
                  imageUrl: 'assets/images/product_image.png',
                  price: 50.00,
                  inventoryQuantity: 20,
                ),
                SizedBox(height: 10),
                Divider(),
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
