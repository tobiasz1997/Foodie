import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/providers/shopping_list.provider.dart';
import 'package:provider/provider.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: const Text('Shopping list'),
      leading: const BackButton(),
    );
  }

  String getMeasurementShort(KitchenMeasurement key, BuildContext context) {
    switch (key) {
      case KitchenMeasurement.teaspoon:
        return AppLocalizations.of(context)!.measurementTeaspoonShort;
      case KitchenMeasurement.tablespoon:
        return AppLocalizations.of(context)!.measurementTablespoonShort;
      case KitchenMeasurement.glass:
        return AppLocalizations.of(context)!.measurementGlassShort;
      case KitchenMeasurement.mug:
        return AppLocalizations.of(context)!.measurementMugShort;
      case KitchenMeasurement.liter:
        return AppLocalizations.of(context)!.measurementLiterShort;
      case KitchenMeasurement.millilitre:
        return AppLocalizations.of(context)!.measurementMillilitreShort;
      case KitchenMeasurement.gram:
        return AppLocalizations.of(context)!.measurementGramShort;
      case KitchenMeasurement.kilogram:
        return AppLocalizations.of(context)!.measurementKilogramShort;
      case KitchenMeasurement.pinch:
        return AppLocalizations.of(context)!.measurementPinchShort;
      case KitchenMeasurement.handful:
        return AppLocalizations.of(context)!.measurementHandfulShort;
      case KitchenMeasurement.drop:
        return AppLocalizations.of(context)!.measurementDropShort;
      case KitchenMeasurement.unit:
        return AppLocalizations.of(context)!.measurementUnitShort;
      default:
        return AppLocalizations.of(context)!.measurementUnitShort; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final ingredientsProvider = Provider.of<ShoppingListProvider>(context);
    final ingredientsList =
        Provider.of<ShoppingListProvider>(context).getIngredients;
    return Scaffold(
      appBar: _appBar(context),
      body: ingredientsList.isEmpty
          ? const Center(
              child: Text("No data"),
            )
          : ListView.builder(
              itemCount: ingredientsList.length,
              itemBuilder: (ctx, index) {
                final ingredient = ingredientsList[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 5),
                  child: Row(
                    children: [
                      Checkbox(
                        value: ingredient.active,
                        onChanged: (_) =>
                            ingredientsProvider.setActiveState(index),
                      ),
                      Expanded(
                        child: Text(
                          ingredient.product.name.pl,
                          style: TextStyle(
                            decoration: ingredient.active
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            ingredient.value.toFixedString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w700,
                              decoration: ingredient.active
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              getMeasurementShort(
                                  ingredient.measurement, context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                decoration: ingredient.active
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
