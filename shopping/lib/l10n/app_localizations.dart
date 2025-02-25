import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @use.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get use;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show Password'**
  String get showPassword;

  /// No description provided for @signUpPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpPageTitle;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @copyPassword.
  ///
  /// In en, this message translates to:
  /// **'Copy Password'**
  String get copyPassword;

  /// No description provided for @copyUsername.
  ///
  /// In en, this message translates to:
  /// **'Copy Username'**
  String get copyUsername;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @deletePassword.
  ///
  /// In en, this message translates to:
  /// **'Delete Password'**
  String get deletePassword;

  /// No description provided for @emailExample.
  ///
  /// In en, this message translates to:
  /// **'email@example.com'**
  String get emailExample;

  /// No description provided for @pleaseAwait.
  ///
  /// In en, this message translates to:
  /// **'Please await'**
  String get pleaseAwait;

  /// No description provided for @showPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Password is:'**
  String get showPasswordTitle;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'manager'**
  String get manager;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get signupTitle;

  /// No description provided for @headingFirst.
  ///
  /// In en, this message translates to:
  /// **'Transparent & Secured.'**
  String get headingFirst;

  /// No description provided for @contextFirst.
  ///
  /// In en, this message translates to:
  /// **'Only you can see your personal data'**
  String get contextFirst;

  /// No description provided for @registerFailed.
  ///
  /// In en, this message translates to:
  /// **'Register failed'**
  String get registerFailed;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don`t have an account? '**
  String get dontHaveAnAccount;

  /// No description provided for @sendEmailVerification.
  ///
  /// In en, this message translates to:
  /// **'Registration successful. Please check your email for verification instructions.'**
  String get sendEmailVerification;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPasswordTitle;

  /// No description provided for @givePassword.
  ///
  /// In en, this message translates to:
  /// **'We have a sent a password recovery instruction to your email'**
  String get givePassword;

  /// No description provided for @forgotPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Email not found'**
  String get forgotPasswordError;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @listPasswordBlank.
  ///
  /// In en, this message translates to:
  /// **'Empty data'**
  String get listPasswordBlank;

  /// No description provided for @openApp.
  ///
  /// In en, this message translates to:
  /// **'Open App'**
  String get openApp;

  /// No description provided for @openWeb.
  ///
  /// In en, this message translates to:
  /// **'Open Web'**
  String get openWeb;

  /// No description provided for @typeCardFirst.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get typeCardFirst;

  /// No description provided for @typeCardSecond.
  ///
  /// In en, this message translates to:
  /// **'Softwares'**
  String get typeCardSecond;

  /// No description provided for @typeCardThird.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get typeCardThird;

  /// No description provided for @webperts.
  ///
  /// In en, this message translates to:
  /// **'webperts'**
  String get webperts;

  /// No description provided for @addCardPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Card Password'**
  String get addCardPasswordTitle;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @editCardPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Card Password'**
  String get editCardPasswordTitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **' Login'**
  String get login;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @loginPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginPageTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginTitle;

  /// No description provided for @loginButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginButtonTitle;

  /// No description provided for @loginWith.
  ///
  /// In en, this message translates to:
  /// **'Login with'**
  String get loginWith;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerTitle;

  /// No description provided for @textFieldConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get textFieldConfirmPassword;

  /// No description provided for @textFieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get textFieldEmail;

  /// No description provided for @textFieldPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get textFieldPassword;

  /// No description provided for @textFieldUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get textFieldUsername;

  /// No description provided for @passwordGenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate Password'**
  String get passwordGenerate;

  /// No description provided for @passwordTypeSelection.
  ///
  /// In en, this message translates to:
  /// **'Choose a password type'**
  String get passwordTypeSelection;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get moreOptions;

  /// No description provided for @lowercaseSelection.
  ///
  /// In en, this message translates to:
  /// **'Lowercase (abc)'**
  String get lowercaseSelection;

  /// No description provided for @uppercaseSelection.
  ///
  /// In en, this message translates to:
  /// **'Uppercase (ABC)'**
  String get uppercaseSelection;

  /// No description provided for @numbersSelection.
  ///
  /// In en, this message translates to:
  /// **'Numbers (123)'**
  String get numbersSelection;

  /// No description provided for @symbolsSelection.
  ///
  /// In en, this message translates to:
  /// **'Randomized symbols (!#\$)'**
  String get symbolsSelection;

  /// No description provided for @allowAllCharacters.
  ///
  /// In en, this message translates to:
  /// **'Allow all characters'**
  String get allowAllCharacters;

  /// No description provided for @anyCharacterCombination.
  ///
  /// In en, this message translates to:
  /// **'Any character combination'**
  String get anyCharacterCombination;

  /// No description provided for @easyToReadCharacters.
  ///
  /// In en, this message translates to:
  /// **'Easy to read'**
  String get easyToReadCharacters;

  /// No description provided for @avoidAmbiguousCharacters.
  ///
  /// In en, this message translates to:
  /// **'Avoid ambiguous characters, like o, O, I, i'**
  String get avoidAmbiguousCharacters;

  /// No description provided for @easyToSayCharacters.
  ///
  /// In en, this message translates to:
  /// **'Easy to say'**
  String get easyToSayCharacters;

  /// No description provided for @letterSelection.
  ///
  /// In en, this message translates to:
  /// **'Just lowercase and uppercase characters'**
  String get letterSelection;

  /// No description provided for @existCardPassword.
  ///
  /// In en, this message translates to:
  /// **'CardPassword already exists in the list'**
  String get existCardPassword;

  /// No description provided for @clipboardCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get clipboardCopied;

  /// No description provided for @usernameWasCopied.
  ///
  /// In en, this message translates to:
  /// **'Username was copied to the clipboard'**
  String get usernameWasCopied;

  /// No description provided for @passwordWasCopied.
  ///
  /// In en, this message translates to:
  /// **'Password was copied to the clipboard'**
  String get passwordWasCopied;

  /// No description provided for @verifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email account'**
  String get verifyEmail;

  /// No description provided for @invalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid input. Please check your data and try again.'**
  String get invalidInput;

  /// No description provided for @forgotPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email below to receive password reset'**
  String get forgotPasswordText;

  /// No description provided for @checkPassword.
  ///
  /// In en, this message translates to:
  /// **'Check your password'**
  String get checkPassword;

  /// No description provided for @messageLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get messageLogout;

  /// No description provided for @messageDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you would like to delete this site?'**
  String get messageDelete;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please connect and try again'**
  String get noInternet;

  /// No description provided for @congatulation.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congatulation;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
