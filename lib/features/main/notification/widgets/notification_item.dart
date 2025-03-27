import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping/const/const.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../../../theme/theme.dart';

class NotificationItem extends HookWidget {
  final String title;
  final String description;
  final bool isRead;
  final VoidCallback? onTap;
  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.isRead,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final isReadState = useState<bool>(isRead);

    return GestureDetector(
      onTap: () {
        if (isReadState.value == false) {
          isReadState.value = true;
          onTap?.call();
        }
      },
      child: Container(
        height: 125,
        color: !isReadState.value ? AppColors.white100 : null,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  "assets/images/onboarding.png",
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 12,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.black50,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 11,
                          fontFamily: AppConst.nunito,
                          color: AppColors.gray500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    if (!isReadState.value)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          context.intl.newNotification,
                          textAlign: TextAlign.right,
                          style: textTheme.labelSmall?.copyWith(
                            color: AppColors.green700,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
