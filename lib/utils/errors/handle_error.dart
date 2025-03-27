import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HandleError {
  static Exception handle(dynamic error, {String? customMessage}) {
    // Log the error
    debugPrint('Error occurred: $error');
    final String errorMessage = errorMessageHandler(error, customMessage);
    return Exception(errorMessage);
  }

  static String errorMessageHandler(dynamic error, String? customMessage) {
    return switch (error) {
      AuthException() => _handleAuthException(error),
      StorageException() => _handleStorageException(error),
      _ => customMessage ?? ErrorMessages.unknownError
    };
  }

  static String _handleAuthException(AuthException error) {
    // Check for network errors first
    final networkError = _handleNetworkException(error);
    if (networkError != null) {
      return networkError;
    }
    return switch (error) {
      AuthApiException() => _handleAuthApiException(error),
      _ => ErrorMessages.unknownError
    };
  }

  static String _handleAuthApiException(AuthApiException error) {
    if (error.code != null) {
      return switch (error.code) {
        'invalid_credentials' => ErrorMessages.invalidCredentials,
        'user_not_found' => ErrorMessages.userNotFound,
        'email_exists' => ErrorMessages.emailExists,
        'session_expired' => ErrorMessages.sessionExpired,
        'user_banned' => ErrorMessages.userBanned,
        'otp_expired' => ErrorMessages.otpExpired,
        _ => ErrorMessages.unknownError
      };
    }
    return _handleHttpStatusCode(int.parse(error.statusCode!));
  }

  static String _handleStorageException(StorageException error) {
    return switch (error.message) {
      'StorageAccessDeniedException' => ErrorMessages.forbiddenError,
      'StorageNotFoundException' => ErrorMessages.notFound,
      'StoragePathValidationException' => ErrorMessages.storagePathInvalid,
      _ => ErrorMessages.unknownError
    };
  }

  static String _handleHttpStatusCode(int? statusCode) {
    return switch (statusCode) {
      403 => ErrorMessages.forbidden,
      422 => ErrorMessages.unprocessableEntity,
      429 => ErrorMessages.tooManyRequests,
      500 => ErrorMessages.internalServerError,
      501 => ErrorMessages.notImplemented,
      _ => ErrorMessages.unknownError
    };
  }

  static String? _handleNetworkException(dynamic error) {
    if (error is SocketException ||
        error.toString().contains('SocketException')) {
      return ErrorMessages.noInternet;
    }
    return null;
  }
}

class ErrorMessages {
  // Authentication Errors
  static const String invalidCredentials =
      'Invalid username or password. Please try again.';
  static const String sessionExpired =
      'Your session has expired. Please log in again.';
  static const String userNotFound = 'The user was not found.';
  static const String emailExists = 'The email address already exists.';
  static const String userBanned = 'The user is banned.';
  static const String otpExpired = 'The OTP code has expired.';

  // General Errors
  static const String unknownError =
      'An unknown error occurred. Please try again.';
  static const String forbidden = 'Access denied.'; // 403
  static const String unprocessableEntity =
      'Request cannot be processed.'; // 422
  static const String tooManyRequests =
      'Too many requests. Please try again later.'; // 429
  static const String internalServerError =
      'Server error. Please try again later.'; // 500
  static const String notImplemented = 'Feature not available.'; // 501
  static const String noInternet =
      'No internet connection. Please check your network and try again.';

  // Storage Errors
  static const String forbiddenError = 'Access denied. Please try again later.';
  static const String notFound = 'Not found. Please try again later.';
  static const String storagePathInvalid =
      'Invalid storage path specified. Please try again later.';
}
