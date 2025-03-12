import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/theme.dart';

/// A widget that displays a shimmer loading effect.
class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.shimmerItem = 2,
    this.height = 15,
    this.width = double.infinity,
    this.bottomPadding = 5,
    this.isVertical = true,
  });

  /// The number of shimmers to display.
  final int shimmerItem;

  /// The height of each shimmer.
  final double height;

  /// The width of each shimmer.
  final double width;

  /// The padding at the bottom of each shimmer.
  final double bottomPadding;

  /// Determines if the layout should be vertical (column) or horizontal (row).
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final child = List.generate(
      shimmerItem,
      (index) => Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Shimmer.fromColors(
          baseColor: AppColors.gray200,
          highlightColor: AppColors.gray400,
          child: Container(
            height: height,
            width: width,
            color: AppColors.black100,
          ),
        ),
      ),
    );

    return isVertical
        ? Column(
            children: child,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: child,
          );
  }
}
