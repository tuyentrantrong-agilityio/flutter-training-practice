import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  static const mockUpWidth = 375; // Width of design
  static const mockUpHeight = 812; // Height of design

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  bool smallDevice() => MediaQuery.of(this).size.width < 380;

  // proportionate of screen width
  double sizeWidth(double value) => width * value / mockUpWidth;

  // proportionate of screen height
  double sizeHeight(double value) => height * value / mockUpHeight;

  double sizeOf(double value) => width * value / mockUpWidth;

  SizedBox sizedBox({double? width, double? height}) {
    if (width != null && height != null) {
      return SizedBox(
        width: sizeOf(width),
        height: sizeOf(height),
      );
    } else if (width != null) {
      return SizedBox(
        width: sizeOf(width),
      );
    } else {
      return SizedBox(
        height: sizeOf(height!),
      );
    }
  }

  EdgeInsets padding({
    double? horizontal,
    double? vertical,
    double? top,
    double? left,
    double? right,
    double? bottom,
    double? all,
  }) {
    EdgeInsets data = EdgeInsets.zero;
    // symmetric
    if (horizontal != null) {
      data = data.copyWith(
        left: sizeOf(smallDevice() ? horizontal - 10 : horizontal),
        right: sizeOf(smallDevice() ? horizontal - 10 : horizontal),
      );
    }

    if (vertical != null) {
      data = data.copyWith(
        top: sizeOf(vertical),
        bottom: sizeOf(vertical),
      );
    }

    if (top != null) {
      data = data.copyWith(
        top: sizeOf(top),
      );
    }

    if (right != null) {
      data = data.copyWith(
        right: sizeOf(right),
      );
    }

    if (bottom != null) {
      data = data.copyWith(
        bottom: sizeOf(bottom),
      );
    }

    if (left != null) {
      data = data.copyWith(
        left: sizeOf(left),
      );
    }

    if (all != null) {
      data = data.copyWith(
        left: sizeOf(all),
        top: sizeOf(all),
        right: sizeOf(all),
        bottom: sizeOf(all),
      );
    }

    return data;
  }
}
