import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../providers/auth_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../services/product_share_service.dart';
import '../../../auth/page/onboarding_page.dart';

/// StreamProvider to listen for Deep Links
final deepLinkProvider = StreamProvider<Uri>((ref) {
  final appLinks = AppLinks();

  // Listen to deep links through uriLinkStream
  final stream = appLinks.uriLinkStream;

  // When the provider is disposed, cancel the stream subscription
  ref.onDispose(() {
    stream.listen(null).cancel();
  });

  return stream;
});

/// Handles initial and subsequent deep links.
final initialDeepLinkProvider = FutureProvider<Uri?>((ref) async {
  final appLinks = AppLinks();
  return appLinks.getInitialLink();
});

@RoutePage()
class GuardPage extends HookConsumerWidget {
  const GuardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleDeeplink(BuildContext context, Uri uri) {
      final productId = ProductShareService().handleDeeplink(context, uri);
      if (productId != null) {
        context.pushRoute(ProductRoute(productId: productId));
      }
    }

    // Listen to the initial deep link
    final initialDeepLink = ref.watch(initialDeepLinkProvider);
    initialDeepLink.whenData((uri) {
      if (uri != null) {
        handleDeeplink(context, uri);
      }
    });

    // Listen to subsequent deep links
    ref.listen<AsyncValue<Uri>>(deepLinkProvider, (previous, next) {
      next.whenData((uri) {
        handleDeeplink(context, uri);
      });
    });

    return FutureBuilder<bool>(
      future: ref.read(authNotifierProvider.notifier).checkLoginStatus(),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: snapshot.data == false
              ? const OnboardingPage()
              : AutoTabsScaffold(
                  backgroundColor: Colors.white,
                  routes: const [
                    HomeRoute(),
                    FavoriteRoute(),
                    NotificationRoute(),
                    ProfileRoute(),
                  ],
                  bottomNavigationBuilder: (_, tabsRouter) {
                    return _BottomNavigationBar(
                      currentIndex: tabsRouter.activeIndex,
                      onTap: tabsRouter.setActiveIndex,
                    );
                  },
                ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const _BottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: '',
        ),
      ],
    );
  }
}
