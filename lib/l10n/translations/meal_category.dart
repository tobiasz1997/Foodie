import 'package:flutter/widgets.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/l10n/app_localizations.dart';

String getMealCategory(MealCategory category, BuildContext context) {
  switch (category) {
    case MealCategory.breakfast:
      return AppLocalizations.of(context)!.mealCategoryBreakfast;
    case MealCategory.brunch:
      return AppLocalizations.of(context)!.mealCategoryBrunch;
    case MealCategory.lunch:
      return AppLocalizations.of(context)!.mealCategoryLunch;
    case MealCategory.dinner:
      return AppLocalizations.of(context)!.mealCategoryDinner;
    case MealCategory.snack:
      return AppLocalizations.of(context)!.mealCategorySnack;
    case MealCategory.soup:
      return AppLocalizations.of(context)!.mealCategorySoup;
    case MealCategory.salad:
      return AppLocalizations.of(context)!.mealCategorySalad;
    case MealCategory.dessert:
      return AppLocalizations.of(context)!.mealCategoryDessert;
    case MealCategory.beverages:
      return AppLocalizations.of(context)!.mealCategoryBeverages;
    case MealCategory.starter:
      return AppLocalizations.of(context)!.mealCategoryStarter;
    case MealCategory.other:
      return AppLocalizations.of(context)!.mealCategoryOther;
  }
}
