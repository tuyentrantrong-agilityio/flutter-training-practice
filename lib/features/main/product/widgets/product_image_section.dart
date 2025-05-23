import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../theme/theme.dart';

class ProductImageSection extends StatelessWidget {
  final String imageUrl;

  const ProductImageSection({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: const SizedBox.expand(),
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: _BackButton(onPressed: () => context.maybePop()),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _BackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greenBlue50,
            blurRadius: 40,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 18,
          color: AppColors.black100,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
