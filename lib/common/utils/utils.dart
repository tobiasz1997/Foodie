extension UtilsDouble on double {
  String toFixedString() {
    return this % 1 == 0 ? toInt().toString() : toString();
  }

  double toRoundDouble() {
    return double.tryParse(toFixedString()) ?? this;
  }
}

extension UtilsString on String {
  String firstLetterUppercase() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  double doubleParse() {
    return double.tryParse(replaceAll(',', '.')) ?? 0;
  }
}
