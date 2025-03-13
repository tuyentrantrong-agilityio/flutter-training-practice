import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../providers/auth_provider.dart';
import '../../../../router/app_router.gr.dart';
import '../../../auth/page/onboarding_page.dart';

@RoutePage()
class GuardPage extends ConsumerWidget {
  const GuardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
