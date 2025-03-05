import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NotificationItem extends HookWidget {
  final String title;
  final String description;
  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isRead = useState<bool>(false);
    return Column(
      children: [
        Container(
          height: 125,
          color: const Color(0xFFF5F5F5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    "assets/images/product_image.png",
                    width: 90,
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Expanded(
                        child: Text(
                          description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 10,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!isRead.value)
                const Padding(
                  padding: EdgeInsets.only(right: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'New',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF27AE60),
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
