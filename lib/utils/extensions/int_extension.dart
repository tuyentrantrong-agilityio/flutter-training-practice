extension IntExtensions on int {
  String get toTwoDigitString {
    return toString().padLeft(2, '0');
  }

  String get displayTotalReviews {
    return '($this reviews)';
  }
}
