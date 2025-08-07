import 'package:flutter/material.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/ingredients_mock.dart';
import 'package:foodie/common/models/product.dart';
import 'package:foodie/common/models/select.dart';
import 'package:foodie/common/models/shopping_list_item.dart';
import 'package:foodie/common/storage/database_helper.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/l10n/translations/measurement.dart';
import 'package:logger/logger.dart';

class ShoppingListProvider with ChangeNotifier {
  final DatabaseHelper _dbInstance = DatabaseHelper.instance;
  final logger = Logger();

  List<ShoppingListItem> _shoppingList = [];
  List<Product> _productsList = [];

  List<ShoppingListItem> get getShoppingList => _shoppingList;

  ShoppingListProvider() {
    loadShoppingList();
  }

  Future<void> addShoppingItem(
      {int? productId,
      String? customName,
      required KitchenMeasurement measurement,
      required double value,
      String description = ''}) async {
    var db = await _dbInstance.database;

    ShoppingListItem.validate(productId, customName);

    var newShoppingItem = ShoppingListItem(
      productId: productId,
      customName: customName,
      measurement: measurement,
      value: value,
      description: description,
      active: true,
    );

    ShoppingListItem? duplicatedItem = _findDuplicate(newShoppingItem);

    if (duplicatedItem != null) {
      duplicatedItem.value = duplicatedItem.value + newShoppingItem.value;
      duplicatedItem.description =
          '${duplicatedItem.description ?? ''} ${newShoppingItem.description ?? ''}';
      duplicatedItem.active = true;

      await db.update(dbShoppingListTable, duplicatedItem.toMap(),
          where: 'id = ?', whereArgs: [duplicatedItem.id]).catchError(
        (error) {
          logger.e("Error log", error: error);
          return error;
        },
      ).then((_) {
        logger.i(duplicatedItem);
        loadShoppingList();
      });
    } else {
      await db.insert(dbShoppingListTable, newShoppingItem.toMap()).catchError(
        (error) {
          logger.e("Error log", error: error);
          return error;
        },
      ).then(
        (value) {
          logger.i(newShoppingItem);
          loadShoppingList();
        },
      );
    }
  }

  Future<void> editShoppingItem(
      {required int itemId,
      int? productId,
      String? customName,
      required KitchenMeasurement measurement,
      required double value,
      String? description}) async {
    var db = await _dbInstance.database;

    ShoppingListItem.validate(productId, customName);

    var editedShoppingItem =
        _shoppingList.firstWhere((element) => element.id == itemId);

    editedShoppingItem.productId = productId;
    editedShoppingItem.customName = customName;
    editedShoppingItem.measurement = measurement;
    editedShoppingItem.value = value;
    editedShoppingItem.description = description;

    ShoppingListItem? duplicatedItem = _findDuplicate(editedShoppingItem);

    if (duplicatedItem != null) {
      duplicatedItem.value = duplicatedItem.value + editedShoppingItem.value;
      duplicatedItem.description =
          '${duplicatedItem.description ?? ''} ${editedShoppingItem.description ?? ''}';
      duplicatedItem.active = true;

      await db.transaction((txn) async {
        await txn.update(dbShoppingListTable, duplicatedItem.toMap(),
            where: 'id = ?', whereArgs: [duplicatedItem.id]).catchError(
          (error) {
            logger.e("Error log", error: error);
            return error;
          },
        );
        await txn.delete(dbShoppingListTable,
            where: 'id = ?', whereArgs: [editedShoppingItem.id]).catchError(
          (error) {
            logger.e("Error log", error: error);
            return error;
          },
        );
      }).then((_) {
        logger.i(duplicatedItem);
        loadShoppingList();
      });
    } else {
      await db.update(dbShoppingListTable, editedShoppingItem.toMap(),
          where: 'id = ?', whereArgs: [editedShoppingItem.id]).catchError(
        (error) {
          logger.e("Error log", error: error);
          return error;
        },
      ).then((_) {
        logger.i(editedShoppingItem);
        loadShoppingList();
      });
    }
  }

  Future<void> deleteShoppingItem(int itemId) async {
    var db = await _dbInstance.database;
    await db.delete(dbShoppingListTable,
        where: 'id = ?', whereArgs: [itemId]).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    ).then((_) {
      logger.i("deleted item with id=$itemId");
      loadShoppingList();
    });
  }

  Future<void> loadShoppingList() async {
    _shoppingList = [];
    _productsList = productsMock;

    var db = await _dbInstance.database;
    var result = await db.query(dbShoppingListTable).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    );

    for (var element in result) {
      ShoppingListItem item = ShoppingListItem.fromMap(element);
      item.product = _productsList
              .where((element) => element.id == item.productId)
              .isNotEmpty
          ? _productsList.firstWhere((element) => element.id == item.productId)
          : null;
      _shoppingList.add(item);
    }

    logger.d(result);
    notifyListeners();
  }

  Future<void> setActiveState(int id) async {
    var item = _shoppingList.firstWhere((element) => element.id == id);

    item.active = !item.active;

    var db = await _dbInstance.database;
    await db.update(dbShoppingListTable, item.toMap(),
        where: 'id = ?', whereArgs: [id]).catchError(
      (error) {
        logger.e("Error log", error: error);
        return error;
      },
    ).then((_) {
      logger.i(item);
      loadShoppingList();
    });
  }

  List<SelectionItem<int>> getProductsList({String lang = 'pl'}) {
    var list = _productsList
        .map(
          (product) => SelectionItem(
            label: lang == 'pl' ? product.name.pl : product.name.en,
            value: product.id,
          ),
        )
        .toList();
    list.sort((a, b) => a.label.compareTo(b.label));
    list.add(SelectionItem(label: '', value: null));

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

  ShoppingListItem? _findDuplicate(ShoppingListItem item) {
    if (item.productId == null) {
      return null;
    }
    var isExist = _shoppingList
        .where((element) =>
            element.productId == item.productId &&
            element.measurement == item.measurement &&
            element.id != item.id)
        .firstOrNull;

    return isExist;
  }
}
