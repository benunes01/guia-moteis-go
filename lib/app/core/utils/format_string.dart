import 'dart:convert';

String convertMoneyToBrazil(double value) {
  return value.toStringAsFixed(2).replaceAll('.', ',');
}

String fixEncoding(String text) {
  return utf8.decode(text.runes.toList(), allowMalformed: true);
}