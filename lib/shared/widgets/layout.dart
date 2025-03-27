import 'package:flutter/material.dart';

/// A main layout for the lotus app.
class MainLayout extends StatelessWidget {
  /// Constructs a [MainLayout].
  const MainLayout({
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
