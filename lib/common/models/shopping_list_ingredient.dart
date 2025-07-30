import 'dart:convert';

import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/product.dart';

ShoppingListIngredient ingredientFromMap(String str) =>
    ShoppingListIngredient.fromMap(json.decode(str));

String ingredientToMap(ShoppingListIngredient data) =>
    json.encode(data.toMap());

class ShoppingListIngredient {
  int? id;
  int productId;
  Product? product;
  String? description;
  KitchenMeasurement measurement;
  double value;
  bool active;

  ShoppingListIngredient({
    this.id,
    required this.productId,
    this.product,
    this.description,
    required this.measurement,
    required this.value,
    required this.active,
  });

  factory ShoppingListIngredient.fromMap(Map<String, dynamic> json) =>
      ShoppingListIngredient(
        id: json["id"],
        productId: json["productId"] is String
            ? int.parse(json["productId"])
            : json["productId"],
        description: json["description"],
        measurement: KitchenMeasurement.values.firstWhere(
          (e) => e.toString().split('.').last == json['measurement'],
          orElse: () => KitchenMeasurement.unit,
        ),
        value: json["value"] is String
            ? double.parse(json["value"])
            : json["value"],
        active: json["active"] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "productId": productId,
        "description": description,
        "measurement": measurement.toString().split('.').last,
        "value": value,
        "active": active ? 1 : 0,
      };
}
