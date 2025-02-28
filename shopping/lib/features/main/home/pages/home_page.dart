import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../theme/theme.dart';
import '../widgets/product_card.dart';
import '../widgets/type_item.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final AppLocalizations l10n = context.intl;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/images/search.svg"),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          l10n.makeHome,
                          style: textTheme.bodyMedium,
                        ),
                        Text(
                          l10n.beutiful,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset("assets/images/cart.svg"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 30.0,
                    crossAxisCount: 1,
                  ),
                  children: const [
                    TypeItem(
                      active: true,
                      child: Icon(
                        Icons.star_outlined,
                        size: 30,
                        color: AppColors.white,
                      ),
                    ),
                    TypeItem(
                      child: Icon(
                        Icons.event_seat_outlined,
                        size: 30,
                        color: AppColors.white,
                      ),
                    ),
                    TypeItem(
                      child: Icon(
                        Icons.table_restaurant,
                        size: 30,
                        color: AppColors.white,
                      ),
                    ),
                    TypeItem(
                      child: Icon(
                        Icons.weekend,
                        size: 30,
                        color: AppColors.white,
                      ),
                    ),
                    TypeItem(
                      child: Icon(
                        Icons.king_bed,
                        size: 30,
                        color: AppColors.white,
                      ),
                    ),
                    TypeItem(
                      child: Icon(
                        Icons.light,
                        size: 30,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 10,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Số cột
                    // crossAxisSpacing: 30.0, // Khoảng cách giữa các cột
                    // mainAxisSpacing: 30.0, // Khoảng cách giữa các hàng
                    childAspectRatio:
                        0.7, // Tỷ lệ giữa chiều rộng và chiều cao của item
                  ),
                  itemCount: 10, // Số lượng item
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      name: 'Black Simple Lamp',
                      image: 'assets/images/product_image.png',
                      type: 'Chair',
                      cost: 12.00,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
