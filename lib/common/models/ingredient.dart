import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/product.dart';

Ingredient ingredientFromMap(String str) =>
    Ingredient.fromMap(json.decode(str));

String ingredientToMap(Ingredient data) => json.encode(data.toMap());

class Ingredient {
  int id;
  Product product;
  String? description;
  KitchenMeasurement measurement;
  double value;
  bool active;

  Ingredient({
    required this.id,
    required this.product,
    this.description,
    required this.measurement,
    required this.value,
    required this.active,
  });

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        product: Product.fromMap(json["product"]),
        description: json["description"],
        measurement: KitchenMeasurement.values.firstWhere(
          (e) => e.toString().split('.').last == json['measurement'],
          orElse: () =>
              KitchenMeasurement.unit, // Domyślnie 'unit', jeśli nie pasuje
        ),
        value: json["value"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product": product.toMap(),
        "description": description,
        "measurement": measurement.toString().split('.').last,
        "value": value,
        "active": active,
      };
}

enum KitchenMeasurement {
  unit, // Sztuka
  kilogram, // Kilogram (kg) - kg
  gram, // Gram (g) - g
  liter, // Litr (1000 ml) - l
  millilitre, // - ml
  glass, // Szklanka (~250 ml)
  mug, // Filiżanka (~150 ml)
  teaspoon, // Łyżeczka (~5 ml) - tsp
  tablespoon, // Łyżka stołowa (~15 ml) tbsp
  pinch, // Szczypta
  handful, // Garść
  drop, // Kropla
}

String getMeasurementShort(KitchenMeasurement key, BuildContext context) {
  switch (key) {
    case KitchenMeasurement.teaspoon:
      return AppLocalizations.of(context)!.measurementTeaspoonShort;
    case KitchenMeasurement.tablespoon:
      return AppLocalizations.of(context)!.measurementTablespoonShort;
    case KitchenMeasurement.glass:
      return AppLocalizations.of(context)!.measurementGlassShort;
    case KitchenMeasurement.mug:
      return AppLocalizations.of(context)!.measurementMugShort;
    case KitchenMeasurement.liter:
      return AppLocalizations.of(context)!.measurementLiterShort;
    case KitchenMeasurement.millilitre:
      return AppLocalizations.of(context)!.measurementMillilitreShort;
    case KitchenMeasurement.gram:
      return AppLocalizations.of(context)!.measurementGramShort;
    case KitchenMeasurement.kilogram:
      return AppLocalizations.of(context)!.measurementKilogramShort;
    case KitchenMeasurement.pinch:
      return AppLocalizations.of(context)!.measurementPinchShort;
    case KitchenMeasurement.handful:
      return AppLocalizations.of(context)!.measurementHandfulShort;
    case KitchenMeasurement.drop:
      return AppLocalizations.of(context)!.measurementDropShort;
    case KitchenMeasurement.unit:
      return AppLocalizations.of(context)!.measurementUnitShort;
    default:
      return AppLocalizations.of(context)!.measurementUnitShort; // fallback
  }
}

String getMeasurementLong(KitchenMeasurement key, BuildContext context) {
  switch (key) {
    case KitchenMeasurement.teaspoon:
      return AppLocalizations.of(context)!.measurementTeaspoonLong;
    case KitchenMeasurement.tablespoon:
      return AppLocalizations.of(context)!.measurementTablespoonLong;
    case KitchenMeasurement.glass:
      return AppLocalizations.of(context)!.measurementGlassLong;
    case KitchenMeasurement.mug:
      return AppLocalizations.of(context)!.measurementMugLong;
    case KitchenMeasurement.liter:
      return AppLocalizations.of(context)!.measurementLiterLong;
    case KitchenMeasurement.millilitre:
      return AppLocalizations.of(context)!.measurementMillilitreLong;
    case KitchenMeasurement.gram:
      return AppLocalizations.of(context)!.measurementGramLong;
    case KitchenMeasurement.kilogram:
      return AppLocalizations.of(context)!.measurementKilogramLong;
    case KitchenMeasurement.pinch:
      return AppLocalizations.of(context)!.measurementPinchLong;
    case KitchenMeasurement.handful:
      return AppLocalizations.of(context)!.measurementHandfulLong;
    case KitchenMeasurement.drop:
      return AppLocalizations.of(context)!.measurementDropLong;
    case KitchenMeasurement.unit:
      return AppLocalizations.of(context)!.measurementUnitLong;
    default:
      return AppLocalizations.of(context)!.measurementUnitLong; // fallback
  }
}
