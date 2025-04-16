import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping/utils/extensions/extension.dart';

import '../../theme/theme.dart';

class ShoppingTextInput extends StatelessWidget {
  final String? initialValue;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final bool autofocus;
  final TextAlign textAlign;
  final double? cursorHeight;
  final int? maxLines;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final bool enableSuggestions;
  final TextEditingController? controller;
  final TextStyle? style;
  final bool obscureText;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final bool unFocusOutside;
  final List<TextInputFormatter>? inputFormatters;

  const ShoppingTextInput({
    super.key,
    this.initialValue,
    this.onChanged,
    this.autofocus = false,
    this.textAlign = TextAlign.start,
    this.cursorHeight,
    this.decoration,
    this.maxLines,
    this.keyboardType,
    this.enableSuggestions = false,
    this.controller,
    this.style,
    this.validator,
    this.obscureText = false,
    this.unFocusOutside = true,
    this.enabled = true,
    this.inputFormatters,
    this.autocorrect = false,
    this.textCapitalization = TextCapitalization.none,
  });

  factory ShoppingTextInput.email(
    final BuildContext context, {
    final TextEditingController? controller,
  }) {
    return ShoppingTextInput(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      style: context.textTheme.bodySmall,
      validator: (value) => value?.validateEmail(context),
    );
  }
  factory ShoppingTextInput.name(
    final BuildContext context, {
    final TextEditingController? controller,
    final String? Function(String?)? validator,
  }) {
    return ShoppingTextInput(
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s{2,}'))],
      controller: controller,
      style: context.textTheme.bodySmall,
      validator: validator,
    );
  }
  factory ShoppingTextInput.password(
    final BuildContext context, {
    final TextEditingController? controller,
    final String? Function(String?)? validator,
  }) {
    final ValueNotifier<bool> obscureText = useState(true);
    return ShoppingTextInput(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      obscureText: obscureText.value,
      maxLines: 1,
      controller: controller,
      style: context.textTheme.bodySmall,
      decoration: InputDecoration(
        suffixIcon: HookBuilder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                obscureText.value ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () => obscureText.value = !obscureText.value,
            );
          },
        ),
      ),
      validator: validator,
    );
  }

  factory ShoppingTextInput.promoCode(
    final BuildContext context, {
    final TextEditingController? controller,
    final String? hintText,
  }) {
    final labelSmall = context.textTheme.labelSmall?.copyWith(
      fontSize: 16,
      color: AppColors.gray400,
    );
    return ShoppingTextInput(
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: labelSmall,
        border: InputBorder.none,
      ),
      style: labelSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      enabled: enabled,
      autofocus: autofocus,
      maxLines: maxLines,
      textAlign: textAlign,
      cursorHeight: cursorHeight,
      decoration: decoration,
      onChanged: onChanged,
      autocorrect: autocorrect,
      keyboardType: keyboardType,
      enableSuggestions: enableSuggestions,
      controller: controller,
      style: style,
      obscureText: obscureText,
      validator: validator,
      onTapOutside: (event) {
        if (unFocusOutside) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }
}
