import 'package:flutter_test/flutter_test.dart';
import 'package:shopping/l10n/app_localizations_en.dart';
import 'package:shopping/utils/errors/handle_error.dart';

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => 'Exception: $message';
}

class AuthExceptions {
  static final AuthException emailRequired =
      AuthException(AppLocalizationsEn().emailRequired);
  static final AuthException invalidEmailFormat =
      AuthException(AppLocalizationsEn().invalidEmailFormat);
  static final AuthException passwordRequired =
      AuthException(AppLocalizationsEn().passwordRequired);
  static final AuthException passwordTooShort =
      AuthException(AppLocalizationsEn().passwordTooShort);
  static final AuthException networkError =
      AuthException(ErrorMessages.noInternet);
  static final AuthException userAlreadyExists =
      AuthException(ErrorMessages.emailExists);
  static final AuthException incorrectCredentials =
      AuthException(ErrorMessages.invalidCredentials);
  static final AuthException forbidden = AuthException(ErrorMessages.forbidden);
  static final AuthException unprocessableEntity =
      AuthException(ErrorMessages.unprocessableEntity);
  static final AuthException tooManyRequests =
      AuthException(ErrorMessages.tooManyRequests);
  static final AuthException internalServerError =
      AuthException(ErrorMessages.internalServerError);
  static final AuthException notImplemented =
      AuthException(ErrorMessages.notImplemented);
}

Matcher throwsExpectedException(AuthException expectedException) {
  return throwsA(
    isA<Exception>().having(
      (e) => e.toString(),
      'message',
      equals(expectedException.toString()),
    ),
  );
}
