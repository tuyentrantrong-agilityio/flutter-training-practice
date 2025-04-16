import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/shared/extensions/category_extension.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../providers/category_provider.dart';
import '../../../../providers/product_provider.dart';
import '../../../../providers/profile_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../services/local_notification_service.dart';
import '../../../../shared/widgets/widget.dart';
import '../../../../theme/theme.dart';
import '../widgets/overview_card.dart';
import '../widgets/type_item.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;
    final bodyMedium = textTheme.bodyMedium;
    final asyncListCategory = ref.watch(categoryNotifierProvider);
    final asyncListProduct = ref.watch(productNotifierProvider);
    useEffect(
      () {
        // Listen to FCM token refresh
        final tokenRefreshSubscription =
            FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
          await ref
              .watch(profileNotifierProvider.notifier)
              .setFcmToken(fcmToken);
        });
        // Listen to incoming messages
        final messageSubscription =
            FirebaseMessaging.onMessage.listen((payload) {
          final notification = payload.notification;
          if (notification != null) {
            LocalNotificationService().showLocalNotification(
              id: notification.hashCode,
              title: notification.title ?? '',
              body: notification.body ?? '',
            );
          }
        });

        // Cleanup subscriptions when widget is disposed
        return () {
          tokenRefreshSubscription.cancel();
          messageSubscription.cancel();
        };
      },
      [],
    ); // Empty dependency array ensures this only runs once
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
                    style: bodyMedium,
                  ),
                  Text(
                    l10n.beutiful,
                    style: bodyMedium?.copyWith(
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
            asyncListCategory.when(
              data: (data) {
                return Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2.0,
                      crossAxisCount: 1,
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final activeCategoryId =
                          ref.watch(activeCategoryIdProvider.notifier).state;

                      return GestureDetector(
                        onTap: () {
                          ref.read(activeCategoryIdProvider.notifier).state =
                              data[index].categoryId;
                          ref
                              .watch(productNotifierProvider.notifier)
                              .filterProductsByCategory(
                                data[index].categoryId!,
                                data[index].name,
                              );
                        },
                        child: TypeItem(
                          title: data[index].name,
                          active: data[index].categoryId == activeCategoryId,
                          child: Icon(
                            data[index].icon,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (_, __) => const SizedBox.shrink(),
              loading: () => const ShimmerLoading(),
            ),
            const SizedBox(height: 10),
            asyncListProduct.when(
              data: (data) {
                return Expanded(
                  flex: 8,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.66,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final product = data[index];
                      return GestureDetector(
                        onTap: () =>
                            context.pushRoute(ProductRoute(product: product)),
                        child: OverviewCard(
                          product: product,
                        ),
                      );
                    },
                  ),
                );
              },
              error: (_, __) => const SizedBox.shrink(),
              loading: () => const ShimmerLoading(),
            ),
          ],
        ),
      ),
    );
  }
}
