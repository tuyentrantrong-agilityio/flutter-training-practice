extension DoubleExtensions on double {
  String get toCurrencyFormat {
    return '\$ ${toStringAsFixed(2)}';
  }
}
