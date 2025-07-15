import 'dart:convert';

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
        product: Product.fromMap(json["name"]),
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
  teaspoon, // Łyżeczka (~5 ml) - tsp
  tablespoon, // Łyżka stołowa (~15 ml) tbsp
  glass, // Szklanka (~250 ml)
  mug, // Filiżanka (~150 ml)
  liter, // Litr (1000 ml) - l
  millilitre, // - ml
  gram, // Gram (g) - g
  kilogram, // Kilogram (kg) - kg
  pinch, // Szczypta
  handful, // Garść
  drop, // Kropla
  unit // Sztuka
}
