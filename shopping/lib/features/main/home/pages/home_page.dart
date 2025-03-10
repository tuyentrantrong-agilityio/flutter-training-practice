import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping/services/category_service.dart';
import 'package:shopping/shared/extensions/category_extension.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/category.dart';
import '../../../../models/product.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../services/product_service.dart';
import '../../../../shared/widgets/widget.dart';
import '../../../../theme/theme.dart';
import '../widgets/overview_card.dart';
import '../widgets/type_item.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;

    return MainLayout(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HeaderWidget(
              leftIcon: Icons.search_outlined,
              onLeftFunction: () => {},
              titleWidget: Column(
                children: [
                  Text(
                    l10n.makeHome,
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    l10n.beutiful,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black100,
                    ),
                  ),
                ],
              ),
              rightIcon: Icons.shopping_cart_outlined,
              onRightFunction: () => context.pushRoute(const CartRoute()),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Category>>(
              future: CategoryService().getAllCategory(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 5.0,
                          crossAxisCount: 1,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TypeItem(
                            title: snapshot.data![index].name,
                            child: Icon(
                              snapshot.data![index].icon,
                            ),
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<List<Product>>(
              future: ProductService().getAllProduct(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return Expanded(
                      flex: 9,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final product = snapshot.data![index];

                          return GestureDetector(
                            onTap: () => context
                                .pushRoute(ProductRoute(product: product)),
                            child: OverviewCard(
                              name: product.name,
                              image: product.imageUrl!,
                              cost: product.price,
                            ),
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
