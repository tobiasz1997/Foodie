extension UtilsDouble on double {
  String toFixedString() {
    return this % 1 == 0 ? toInt().toString() : toString();
  }
}
