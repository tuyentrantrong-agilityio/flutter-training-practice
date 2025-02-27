extension IntExtensions on int {
  String get toTwoDigitString {
    return toString().padLeft(2, '0');
  }
}
