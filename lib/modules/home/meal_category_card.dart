import 'package:flutter/material.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/l10n/translations/meal_category.dart';

class MealCategoryCard extends StatelessWidget {
  final MealCategory category;

  const MealCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          getMealCategory(category, context).toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
