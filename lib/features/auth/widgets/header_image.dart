import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/const.dart';
import '../../../theme/theme.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Divider(
        color: AppColors.gray300,
        thickness: 1,
        indent: 16,
        endIndent: 16,
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomLine(),
        SvgPicture.asset(
          AppConst.badgeImage,
          width: 64,
          height: 64,
        ),
        const CustomLine(),
      ],
    );
  }
}
