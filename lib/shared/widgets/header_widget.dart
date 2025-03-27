
import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../theme/theme.dart';

/// A header widget with an optional left button, title, and an optional right button.
class HeaderWidget extends StatelessWidget {
  /// Constructor for the HeaderWidget.

  const HeaderWidget({
    super.key,
    this.title,
    this.onLeftFunction,
    this.onRightFunction,
    this.titleWidget,
    this.leftIcon,
    this.rightIcon,
  });

  /// The title of the header widget.
  final String? title;

  /// The widget to be displayed in the middle of the header widget.
  final Widget? titleWidget;

  /// The icon to be displayed on the left side of the header widget.
  final IconData? leftIcon;

  /// The icon to be displayed on the right side of the header widget.
  final IconData? rightIcon;

  /// Function to be called when the left button is pressed.
  final void Function()? onLeftFunction;

  /// Function to be called when the right button is pressed.
  final void Function()? onRightFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Display the back button if [onLeftFunction] is not null
        if (onLeftFunction == null)
          const SizedBox(width: 56)
        else
          IconButton(
            icon: Icon(
              leftIcon ?? Icons.arrow_back,
              color: AppColors.gray500,
              size: 24.0,
            ),
            onPressed: onLeftFunction,
          ),
        // Display the title widget if [title] is null
        if (title == null)
          titleWidget ?? const SizedBox.shrink()
        else
          Expanded(
            child: Text(
              title ?? '',
              style: context.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        // Display the close button if [onRightFunction] is not null
        if (onRightFunction == null)
          const SizedBox(width: 56)
        else
          IconButton(
            icon: Icon(
              rightIcon ?? Icons.close,
              color: AppColors.gray500,
              size: 24.0,
            ),
            onPressed: onRightFunction,
          ),
      ],
    );
  }
}
