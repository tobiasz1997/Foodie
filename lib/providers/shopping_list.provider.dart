import 'package:flutter/material.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/ingredients_mock.dart';
import 'package:foodie/common/models/product.dart';
import 'package:foodie/common/models/select.dart';
import 'package:foodie/common/models/shopping_list_ingredient.dart';
import 'package:foodie/common/storage/database_helper.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:logger/logger.dart';

class ShoppingListProvider with ChangeNotifier {
  final DatabaseHelper _dbInstance = DatabaseHelper.instance;
  final logger = Logger();

  List<ShoppingListIngredient> _ingredientsList = [];
  List<Product> _productsList = [];

  List<ShoppingListIngredient> get getIngredients => _ingredientsList;

  ShoppingListProvider() {
    loadShoppingList();
  }

  Future<void> addIngredient(
      {required int productId,
      required KitchenMeasurement measurement,
      required double value,
      String description = ''}) async {
    var db = await _dbInstance.database;
    var newIngredient = ShoppingListIngredient(
      productId: productId,
      measurement: measurement,
      value: value,
      description: description,
      active: false,
    );

    logger.i(newIngredient);

    await db.insert(dbIngredientTable, newIngredient.toMap()).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    ).then(
      (value) => loadShoppingList(),
    );
  }

  Future<void> editIngredient(
      {required int ingredientId,
      required int productId,
      required KitchenMeasurement measurement,
      required double value,
      String? description}) async {
    var ingredient =
        _ingredientsList.firstWhere((element) => element.id == ingredientId);

    ingredient.productId = productId;
    ingredient.measurement = measurement;
    ingredient.value = value;
    ingredient.description = description;

    var db = await _dbInstance.database;
    await db.update(dbIngredientTable, ingredient.toMap(),
        where: 'id = ?', whereArgs: [ingredientId]).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    ).then((_) => loadShoppingList());
  }

  Future<void> loadShoppingList() async {
    _ingredientsList = [];
    _productsList = productsMock;

    var db = await _dbInstance.database;
    var result = await db.query(dbIngredientTable).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    );

    for (var element in result) {
      ShoppingListIngredient ingredient =
          ShoppingListIngredient.fromMap(element);
      ingredient.product = _productsList
          .firstWhere((element) => element.id == ingredient.productId);
      _ingredientsList.add(ingredient);
    }
    logger.d(result);

    notifyListeners();
  }

  Future<void> setActiveState(int id) async {
    var ingredient = _ingredientsList.firstWhere((element) => element.id == id);

    ingredient.active = !ingredient.active;

    var db = await _dbInstance.database;
    await db.update(dbIngredientTable, ingredient.toMap(),
        where: 'id = ?', whereArgs: [id]).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    ).then((_) => loadShoppingList());
  }

  Future<void> removeIngredient(int id) async {
    var db = await _dbInstance.database;
    await db
        .delete(dbIngredientTable, where: 'id = ?', whereArgs: [id]).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    ).then((_) => loadShoppingList());
  }

  List<SelectionItem<int>> getProductsList({String lang = 'pl'}) {
    var list = _productsList
        .map(
          (product) => SelectionItem(
            label: lang == 'pl' ? product.name.pl : product.name.en,
            value: product.id,
          ),
        )
        .toList(growable: false);

    list.sort((a, b) => a.label.compareTo(b.label));

    return list;
  }

  List<SelectionItem<KitchenMeasurement>> getMeasurementsList(
      BuildContext context) {
    return KitchenMeasurement.values
        .map(
          (measurement) => SelectionItem(
            label:
                getMeasurementLong(measurement, context).firstLetterUppercase(),
            value: measurement,
          ),
        )
        .toList(growable: false);
  }
}
