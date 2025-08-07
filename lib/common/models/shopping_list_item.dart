import 'dart:convert';

import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/product.dart';
import 'package:foodie/common/utils/exception.dart';

ShoppingListItem shoppingListItemFromMap(String str) =>
    ShoppingListItem.fromMap(json.decode(str));

String shoppingListItemToMap(ShoppingListItem data) =>
    json.encode(data.toMap());

class ShoppingListItem {
  int? id;
  int? productId;
  String? customName;
  Product? product;
  String? description;
  KitchenMeasurement measurement;
  double value;
  bool active;

  ShoppingListItem({
    this.id,
    this.productId,
    this.customName,
    this.product,
    this.description,
    required this.measurement,
    required this.value,
    required this.active,
  });

  factory ShoppingListItem.fromMap(Map<String, dynamic> json) =>
      ShoppingListItem(
        id: json['id'],
        customName: json['customName'],
        productId: json['productId'] is String
            ? int.parse(json['productId'])
            : json['productId'],
        description: json['description'],
        measurement: KitchenMeasurement.values.firstWhere(
          (e) => e.toString().split('.').last == json['measurement'],
          orElse: () => KitchenMeasurement.unit,
        ),
        value: json['value'] is String
            ? double.parse(json['value'])
            : json['value'],
        active: json['active'] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'productId': productId,
        'customName': customName,
        'description': description,
        'measurement': measurement.toString().split('.').last,
        'value': value,
        'active': active ? 1 : 0,
      };

  static validate(int? productId, String? title) {
    if (!((productId != null && title == null) ||
        (productId == null && title != null && title.isNotEmpty))) {
      const errorMessage = 'Must be selected product or title';
      throw CustomException(errorMessage, errorCode: ExceptionCode.ve001);
    }
  }
}
