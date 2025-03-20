import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../theme/theme.dart';

class ProductQuantitySection extends HookWidget {
  final ValueNotifier<int> quantity;
  final int inventoryQuantity;
  final Future<void> Function(int)? updateQuantity;
  const ProductQuantitySection({
    super.key,
    required this.quantity,
    required this.inventoryQuantity,
    this.updateQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final _debounce = useRef<Timer?>(null);

    void _onQuantityChanged(int newQuantity) {
      if (_debounce.value?.isActive ?? false) _debounce.value!.cancel();
      _debounce.value = Timer(const Duration(milliseconds: 700), () {
        updateQuantity?.call(newQuantity);
      });
    }

    return Row(
      children: [
        QuantityButton(
          icon: Icons.add,
          onPressed: () {
            if (quantity.value < inventoryQuantity) {
              quantity.value++;
              _onQuantityChanged(quantity.value);
            }
          },
        ),
        const SizedBox(width: 10),
        Text(
          quantity.value.toString(),
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.black50,
            letterSpacing: 0.90,
          ),
        ),
        const SizedBox(width: 10),
        QuantityButton(
          icon: Icons.remove,
          onPressed: () {
            if (quantity.value > 1) {
              quantity.value--;
              _onQuantityChanged(quantity.value);
            }
          },
        ),
      ],
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.40,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: IconButton(
          icon: Icon(icon, color: AppColors.black50),
          iconSize: 18,
          padding: EdgeInsets.zero,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
