import 'package:flutter/widgets.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/common/models/recipe_mock.dart';
import 'package:logger/logger.dart';

class RecipeProvider with ChangeNotifier {
  final logger = Logger();

  List<Recipe> _recipeList = [];

  List<Recipe> get getRecipeList => _recipeList;

  RecipeProvider() {
    loadRecipeList();
  }

  Recipe getRecipe(int id) {
    return _recipeList.firstWhere((element) => element.id == id);
  }

  void loadRecipeList() {
    _recipeList = recipeMock;
  }
}
