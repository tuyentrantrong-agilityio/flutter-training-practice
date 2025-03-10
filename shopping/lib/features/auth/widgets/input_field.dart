import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/extension.dart';

class InputField extends StatelessWidget {
  final String label;
  final Widget child;

  const InputField({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.labelSmall,
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
