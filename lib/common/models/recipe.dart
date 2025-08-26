import 'dart:convert';

Recipe recipeFromMap(String str) => Recipe.fromMap(json.decode(str));

String recipeToMap(Recipe data) => json.encode(data.toMap());

class Recipe {
  int id;
  String name;
  String? description;
  double rating;
  MealCategory category;
  double preparationTime;
  bool favourite;
  String? image;

  Recipe({
    required this.id,
    required this.name,
    this.description,
    required this.rating,
    required this.category,
    required this.preparationTime,
    required this.favourite,
    this.image,
  });

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        rating: json['rating'],
        category: MealCategory.values.firstWhere(
          (e) => e.toString().split('.').last == json['category'],
          orElse: () => MealCategory.other,
        ),
        preparationTime: json['preparationTime'],
        favourite: json['favourite'],
        image: json['image'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'rating': rating,
        'category': category.toString().split('.').last,
        'preparationTime': preparationTime,
        'favourite': favourite,
        'image': image,
      };
}

enum MealCategory {
  breakfast,
  brunch,
  lunch,
  starter,
  dinner,
  snack,
  soup,
  salad,
  dessert,
  beverages,
  other
}
