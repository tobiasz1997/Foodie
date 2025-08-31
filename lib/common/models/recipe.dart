import 'package:foodie/common/models/author.dart';
import 'package:foodie/common/models/ingredient.dart';

class Recipe {
  int id;
  String name;
  String? description;
  double rating;
  int totalRatingVoters;
  int servings;
  MealCategory category;
  double preparationTime;
  bool favourite;
  String? image;

  List<Ingredient> ingredients;
  List<String> stepsToExecute;
  List<String> tips;
  Author author;
  String? originalUrl;

  Recipe({
    required this.id,
    required this.name,
    this.description,
    required this.rating,
    required this.totalRatingVoters,
    required this.servings,
    required this.category,
    required this.preparationTime,
    required this.favourite,
    required this.ingredients,
    required this.stepsToExecute,
    required this.tips,
    required this.author,
    this.image,
    this.originalUrl,
  });
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
