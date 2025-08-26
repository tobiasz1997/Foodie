import 'package:flutter/material.dart';
import 'package:foodie/common/models/recipe.dart';
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

  @override
  Widget build(BuildContext context) {
    Recipe recipe = Provider.of<RecipeProvider>(context).getRecipe(widget.id);

    return Scaffold(
      appBar: _appBar(context, recipe),
      body: Column(
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
          Center(
            child: Hero(
              tag: recipe.id.toString() + 'name',
              child: Text(
                recipe.name,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
