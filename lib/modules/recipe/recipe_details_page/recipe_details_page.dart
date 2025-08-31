import 'package:flutter/material.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/modules/recipe/recipe_details_page/recipe_execute_steps.dart';
import 'package:foodie/modules/recipe/recipe_details_page/recipe_information.dart';
import 'package:foodie/modules/recipe/recipe_details_page/recipe_ingredients.dart';
import 'package:foodie/modules/recipe/recipe_details_page/recipe_page_footer.dart';
import 'package:foodie/modules/recipe/recipe_details_page/recipe_tips.dart';
import 'package:foodie/providers/recipe.provider.dart';
import 'package:foodie/widgets/shared/loading.dart';
import 'package:provider/provider.dart';

class RecipeDetailsPage extends StatefulWidget {
  final int id;

  const RecipeDetailsPage({super.key, required this.id});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  AppBar _appBar(BuildContext context, Recipe recipe) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(recipe.name),
      leading: const BackButton(),
    );
  }

  SizedBox _space() => const SizedBox(
        height: 20,
      );

  @override
  Widget build(BuildContext context) {
    Recipe recipe = Provider.of<RecipeProvider>(context).getRecipe(widget.id);

    return Scaffold(
      appBar: _appBar(context, recipe),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (recipe.image != null && recipe.image!.isNotEmpty)
              Hero(
                tag: recipe.id.toString() + 'image',
                child: Image.network(
                  recipe.image!,
                  width: double.infinity,
                  height: 200,
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
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  RecipeInformation(
                    recipe: recipe,
                  ),
                  _space(),
                  RecipeIngredients(
                    recipe: recipe,
                  ),
                  _space(),
                  RecipeExecuteSteps(
                    steps: recipe.stepsToExecute,
                  ),
                  _space(),
                  RecipeTips(
                    tips: recipe.tips,
                  ),
                  RecipeFooter(recipe: recipe),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
