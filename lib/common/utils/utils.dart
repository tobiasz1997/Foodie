extension UtilsDouble on double {
  String toFixedString() {
    return this % 1 == 0 ? toInt().toString() : toString();
  }

  double toRoundDouble() {
    return double.tryParse(toFixedString()) ?? this;
  }

  String getHour() {
    return this.toString().split('.')[0];
  }

  String getMinutes() {
    var value = this.toString().split('.')[1];
    return value.length == 1 ? value + '0' : value;
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
