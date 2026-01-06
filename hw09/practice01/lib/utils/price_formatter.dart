class PriceFormatter {
  PriceFormatter._();

  static String format(double price) {
    return '\$${price.toStringAsFixed(0)}';
  }
}

