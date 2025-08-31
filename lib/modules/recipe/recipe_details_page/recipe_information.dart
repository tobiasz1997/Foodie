import 'package:flutter/material.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/modules/home/meal_category_card.dart';
import 'package:foodie/widgets/recipe/preparation_time.dart';
import 'package:foodie/widgets/recipe/star_range.dart';
import 'package:foodie/widgets/shared/buttons/favourite_button.dart';

class RecipeInformation extends StatelessWidget {
  final Recipe recipe;

  const RecipeInformation({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Hero(
            tag: recipe.id.toString() + 'name',
            child: Text(
              recipe.name,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
        if (recipe.description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              recipe.description!,
              textAlign: TextAlign.start,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MealCategoryCard(
                category: recipe.category,
              ),
              PreparationTime(
                time: recipe.preparationTime,
                icon: true,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StarRange(
              rating: recipe.rating,
              size: StarRangeSizeEnum.small,
              totalVoters: recipe.totalRatingVoters,
            ),
            FavouriteButton(recipe.favourite, () => null),
          ],
        ),
      ],
    );
  }
}
