import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  int id;
  Name name;
  IngredientsCategory category;

  Product({
    required this.id,
    required this.name,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: Name.fromMap(json["name"]),
        category: IngredientsCategory.values.firstWhere(
          (e) => e.toString().split('.').last == json['category'],
          orElse: () =>
              IngredientsCategory.other, // Domyślnie 'Other', jeśli nie pasuje
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name.toMap(),
        "category": category.toString().split('.').last,
      };
}

class Name {
  String pl;
  String en;

  Name({
    required this.pl,
    required this.en,
  });

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        pl: json["pl"],
        en: json["en"],
      );

  Map<String, dynamic> toMap() => {
        "pl": pl,
        "en": en,
      };
}

enum IngredientsCategory {
  fruits,
  vegetables,
  nuts,
  dryProducts,
  dairy,
  meat,
  fishAndSeafood,
  herbsAndSpices,
  mushrooms,
  other,
  semiFinishedProducts,
  alcohol,
  bread,
  nutrients,
}
