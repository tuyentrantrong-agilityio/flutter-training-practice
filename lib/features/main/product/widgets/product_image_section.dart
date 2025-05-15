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
      child: Container(
        margin: const EdgeInsets.only(left: 52),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: -10,
              child: Container(
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
                    Icons.arrow_back_ios,
                    color: AppColors.black100,
                    size: 18,
                  ),
                  padding: const EdgeInsets.only(left: 8),
                  alignment: Alignment.center,
                  onPressed: () => context.maybePop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
