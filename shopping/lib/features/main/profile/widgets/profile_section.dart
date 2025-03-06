import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../theme/theme.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Container(
              width: 80,
              height: 80,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/onboarding.png"),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tuyen Tran',
                  style: textTheme.labelMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'tuyen@gmail.com',
                  textAlign: TextAlign.justify,
                  style: textTheme.labelSmall?.copyWith(
                    color: AppColors.gray500,
                    height: 1.07,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
