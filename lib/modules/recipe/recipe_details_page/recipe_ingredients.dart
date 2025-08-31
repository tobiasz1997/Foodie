import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/common/utils/exception.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/modules/recipe/recipe_details_page/ingredient_row_info.dart';
import 'package:foodie/modules/recipe/recipe_details_page/recipe_ingredients_actions.dart';
import 'package:foodie/providers/shopping_list.provider.dart';
import 'package:foodie/widgets/shared/toast.dart';
import 'package:provider/provider.dart';

class RecipeIngredients extends StatefulWidget {
  final Recipe recipe;

  const RecipeIngredients({super.key, required this.recipe});

  @override
  State<RecipeIngredients> createState() => _RecipeIngredientsState();
}

class _RecipeIngredientsState extends State<RecipeIngredients> {
  late List<Ingredient> ingredients;
  late int servings;

  @override
  void initState() {
    ingredients =
        widget.recipe.ingredients.map((e) => e.copy()).toList(growable: false);
    servings = widget.recipe.servings;
    super.initState();
  }

  void handleChangeActiveState(int id) {
    var ingredient = ingredients.firstWhere((element) => element.id == id);
    setState(() {
      ingredient.active = !ingredient.active;
    });
  }

  void handleChangeServings(int value) {
    if (!((value == -1 && servings == 1) || (value == 1 && servings == 50))) {
      setState(() {
        ingredients.forEach((element) {
          var itemPerServing = element.value / servings;
          var finalValue = value == 1
              ? element.value + itemPerServing
              : element.value - itemPerServing;
          if (finalValue > 0) {
            element.value = finalValue.toFixedTwo().toRoundDouble();
          } else {
            element.value = 0;
          }
        });

        servings += value;
      });
    }
  }

  Future<void> handleAddToShoppingList() async {
    Provider.of<ShoppingListProvider>(context, listen: false)
        .addIngredientsToShoppingList(list: ingredients)
        .then((value) {
      showToast(
        context,
        AppLocalizations.of(context)!
            .successfullyAddedIngredientsToShoppingList,
      );
    }).catchError(
      (error) {
        showToast(context, error.getMessage(context), type: ToastType.error);
      },
      test: (error) => error is CustomException,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                AppLocalizations.of(context)!
                    .ingredients
                    .firstLetterUppercase(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: RecipeIngredientsActions(
            servings: servings,
            onChange: (v) => handleChangeServings(v),
            onAddToShoppingList: () => handleAddToShoppingList(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: List.generate(
              ingredients.length,
              (index) => IngredientRowItem(
                ingredient: ingredients[index],
                onActiveChange: handleChangeActiveState,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
