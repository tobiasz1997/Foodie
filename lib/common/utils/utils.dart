extension UtilsDouble on double {
  String toFixedString() {
    return this % 1 == 0 ? toInt().toString() : toString();
  }
}

extension UtilsString on String {
  String firstLetterUppercase() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
