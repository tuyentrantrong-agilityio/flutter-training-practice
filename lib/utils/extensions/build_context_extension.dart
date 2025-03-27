import 'package:flutter/material.dart';
import 'package:shopping/l10n/app_localizations_en.dart';

import '../../l10n/app_localizations.dart';

/// Extension methods for [BuildContext] that provides convenient access to
/// common theme properties.
extension BuildContextExtensions on BuildContext {
  /// This getter calls [Theme.of] to retrieve the current [Theme] and then
  /// returns its [textTheme] property.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// This getter calls [S.of] to retrieve the current internationalization
  /// object for the current locale.
  AppLocalizations get intl =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();

  /// This getter calls [Theme.of] to retrieve the current [Theme] and then
  /// returns its [colorScheme] property.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Shows a floating snack bar with text as its content.
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showTextSnackBar(
    String text,
  ) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
}
