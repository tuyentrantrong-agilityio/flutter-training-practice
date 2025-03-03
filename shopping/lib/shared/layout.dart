import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router/app_router.gr.dart';
import '../theme/theme.dart';

@RoutePage()
class GuardPage extends ConsumerWidget {
  const GuardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
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
    );
  }
}

/// A second layout for the lotus app.
class SecondLayout extends StatelessWidget {
  /// Constructs a [SecondLayout].
  const SecondLayout({
    super.key,
    this.appBar,
    required this.body,
    this.hasScrollView = false,
    this.scrollController,
    this.footer,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerFloat,
  });

  /// App bar of the layout
  final PreferredSizeWidget? appBar;

  /// Body of the layout
  final Widget body;

  /// Whether the layout has a scroll view or not (default: false)
  final bool hasScrollView;

  /// Scroll controller for the layout's scroll view
  final ScrollController? scrollController;

  /// Footer widget of the layout
  final Widget? footer;

  /// Floating action button of the layout
  final Widget? floatingActionButton;

  /// Location of the floating action button
  final FloatingActionButtonLocation floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: hasScrollView
            ? SingleChildScrollView(
                controller: scrollController,
                child: body,
              )
            : body,
      ),
      persistentFooterButtons: footer != null ? [footer!] : null,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
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
      // selectedItemColor: AppColors.black100,
      // unselectedItemColor: AppColors.gray200,
      // // selectedFontSize: 24,
      // // unselectedFontSize: 24,
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              size: 24,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 24,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 24,
            ),
            label: ''),
      ],
    );
  }
}
