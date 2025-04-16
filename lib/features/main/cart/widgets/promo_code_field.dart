import 'package:flutter/material.dart';

import '../../../../shared/widgets/widget.dart';
import '../../../../theme/app_colors.dart';

class PromoCodeField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onArrowPressed;

  const PromoCodeField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueGray400,
            blurRadius: 20,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: ShoppingTextInput.promoCode(
              context,
              controller: controller,
              hintText: hintText,
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.gray900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onArrowPressed,
              icon: const Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
