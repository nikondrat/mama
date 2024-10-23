/// Common extensions for [String]
extension StringExtension on String {
  /// Returns a new string with the first [length] characters of this string.
  String limit(int length) =>
      length < this.length ? substring(0, length) : this;

  double extractNumber() {
    // Используем регулярное выражение для поиска чисел
    RegExp regExp = RegExp(r'[\d,]+'); // Ищем цифры и запятую
    Match? match = regExp.firstMatch(toString());

    if (match != null) {
      // Заменяем запятую на точку для преобразования в double
      String numberString = match.group(0)!.replaceAll(',', '.');
      return double.parse(numberString); // Преобразуем строку в double
    }
    return 0;
  }

  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + substring(1);
  }
}
