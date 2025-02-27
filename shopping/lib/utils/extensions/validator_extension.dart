import 'package:flutter/material.dart';
import 'package:shopping/utils/extensions/build_context_extension.dart';

extension Validator on String? {
  // Email validation
  String? validateEmail(BuildContext context) {
    final emailRegex = RegExp(r'^[\w+\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (this?.isEmpty ?? true) {
      return context.intl.emailRequired;
    } else if (!emailRegex.hasMatch(this ?? '')) {
      return context.intl.invalidEmailFormat;
    }
    return null;
  }

  // Password validation
  String? validatePassword(BuildContext context) {
    if (this?.isEmpty ?? true) {
      return context.intl.passwordRequired;
    } else if ((this ?? '').length < 8) {
      return context.intl.passwordTooShort;
    }
    return null;
  }

  // Confirm Password validation
  String? validatePasswordConfirm(BuildContext context, String password) {
    if (this?.isEmpty ?? true) {
      return context.intl.confirmPasswordRequired;
    } else if (this != password) {
      return context.intl.confirmPasswordDontMatch;
    }
    return null;
  }

  // Name validation
  String? validateName(BuildContext context, String name) {
    if (this?.isEmpty ?? true) {
      return context.intl.nameRequired;
    }
    return null;
  }
}
