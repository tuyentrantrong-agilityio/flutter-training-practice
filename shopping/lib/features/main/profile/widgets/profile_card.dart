import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../theme/theme.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String description;
  const ProfileCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;

    return Column(
      children: [
        Container(
          height: 80,
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.greenBlue50,
                blurRadius: 40,
                offset: Offset(0, 7),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.labelMedium?.copyWith(
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.black50,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: textTheme.labelSmall?.copyWith(
                        color: AppColors.gray500,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.gray500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
