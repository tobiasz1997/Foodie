import 'package:flutter/material.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/modules/home/meal_category_card.dart';
import 'package:foodie/widgets/recipe/preparation_time.dart';
import 'package:foodie/widgets/recipe/star_range.dart';
import 'package:foodie/widgets/shared/buttons/favourite_button.dart';
import 'package:foodie/widgets/shared/loading.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Theme.of(context).colorScheme.secondary,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(0),
      child: Column(
        children: [
          if (recipe.image != null && recipe.image!.isNotEmpty)
            Hero(
              tag: recipe.id.toString() + 'image',
              child: Image.network(
                recipe.image!,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : const Padding(
                          padding: EdgeInsets.all(10),
                          child: Loading(),
                        );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: recipe.id.toString() + 'name',
                        child: Text(
                          recipe.name,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      FavouriteButton(recipe.favourite, () => null),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: MealCategoryCard(
                            category: recipe.category,
                          ),
                        ),
                        StarRange(
                          rating: recipe.rating,
                          size: StarRangeSizeEnum.small,
                        ),
                      ],
                    ),
                    PreparationTime(time: recipe.preparationTime),
                  ],
                ),
                if (recipe.description != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      recipe.description!,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
