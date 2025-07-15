import 'package:flutter/widgets.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/ingredients_mock.dart';
import 'package:foodie/common/models/product.dart';

class ShoppingListProvider with ChangeNotifier {
  List<Ingredient> _ingredientsList = [];
  List<Product> _productsList = [];

  List<Ingredient> get getIngredients => _ingredientsList;

  ShoppingListProvider() {
    initShoppingList();
  }

  void initShoppingList() {
    _ingredientsList = ingredientMock;
    _productsList = productsMock;
    notifyListeners();
  }

  void removeIngredient(int id) {
    int index = _ingredientsList.indexWhere((element) => element.id == id);
    if (index >= 0) {
      _ingredientsList.removeAt(index);
      notifyListeners();
    }
  }

  void addIngredient(
      {required int productId,
      required KitchenMeasurement measurement,
      required double value,
      String description = ''}) {
    var lastId = _ingredientsList.lastOrNull?.id;
    Product product =
        _productsList.firstWhere((element) => element.id == productId);

    _ingredientsList.add(Ingredient(
        id: lastId == null ? 0 : lastId + 1,
        product: product,
        measurement: measurement,
        value: value,
        active: false));
    notifyListeners();
  }

  void setActiveState(int index) {
    _ingredientsList[index].active = !_ingredientsList[index].active;
    notifyListeners();
  }
}
