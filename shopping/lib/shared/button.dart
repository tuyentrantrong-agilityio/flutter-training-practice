import 'package:flutter/material.dart';

/// A customizable button widget for the Lotus app.
class ShopppingButton extends StatelessWidget {
  // The child of the button
  final String text;
  // The callback function when the button is pressed
  final VoidCallback? onPressed;
  // The width of the button
  final double? width;
  // The height of the button
  final double? height;

  const ShopppingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 50,
      height: height ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
