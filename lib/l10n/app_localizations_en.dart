import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get makeYour => 'MAKE YOUR';

  @override
  String get homeBeautiful => 'HOME BEAUTIFUL';

  @override
  String get onboardingDescription => 'The best simple place where you discover most wonderful furnitures and make your home beautiful';

  @override
  String get getStarted => 'Get Started';

  @override
  String get hello => 'Hello !';

  @override
  String get welcome => 'WELCOME';

  @override
  String get welcomeBack => 'WELCOME BACK';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get name => 'Name';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get signUp => 'SIGN UP';

  @override
  String get signIn => 'SIGN IN';

  @override
  String get login => ' Log in';

  @override
  String get alreadyHaveAccount => 'Already have account?';

  @override
  String get makeHome => 'Make home';

  @override
  String get beutiful => 'BEAUTIFUL';

  @override
  String get reviews => 'reviews';

  @override
  String get newNotification => 'New';

  @override
  String get myCart => 'My cart';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get addAllToMyCart => 'Add all to my cart';

  @override
  String get checkOut => 'Check out';

  @override
  String get favorites => 'Favorites';

  @override
  String get profile => 'Profile';

  @override
  String get notification => 'Notification';

  @override
  String get emailNotFound => 'Email not found';

  @override
  String get emptyDate => 'Empty data';

  @override
  String get emailRequired => 'Email is required.';

  @override
  String get invalidEmailFormat => 'Invalid email format.';

  @override
  String get passwordRequired => 'Password is required.';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters long.';

  @override
  String get nameRequired => 'Name is required.';

  @override
  String get confirmPasswordRequired => 'Confirm password is required.';

  @override
  String get confirmPasswordDontMatch => 'Confirm password doesn\'t match.';

  @override
  String get messageLogout => 'Are you sure you want to log out?';

  @override
  String get noInternet => 'No internet connection. Please connect and try again';

  @override
  String get myOrders => 'My orders';

  @override
  String myOrdersDescription(Object count) {
    return 'Already have $count orders';
  }

  @override
  String get shippingAddresses => 'Shipping Addresses';

  @override
  String shippingAddressesDescription(Object count) {
    return '$count Addresses';
  }

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String paymentMethodDescription(Object count) {
    return 'You have $count cards';
  }

  @override
  String get myReviews => 'My reviews';

  @override
  String myReviewsDescription(Object count) {
    return 'Reviews for $count items';
  }

  @override
  String get settings => 'Setting';

  @override
  String get settingsDescription => 'Notification, Password, FAQ, Contact';
}
