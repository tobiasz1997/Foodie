import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/shopping_list_ingredient.dart';
import 'package:foodie/modules/shopping_list_page/ingredient_form.dart';

class ManageIngredientPage extends StatefulWidget {
  final ShoppingListIngredient? ingredient;

  const ManageIngredientPage({super.key, this.ingredient});

  @override
  State<ManageIngredientPage> createState() => _ManageIngredientPageState();
}

class _ManageIngredientPageState extends State<ManageIngredientPage> {
  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(
        widget.ingredient != null
            ? AppLocalizations.of(context)!.editIngredient
            : AppLocalizations.of(context)!.addIngredient,
      ),
      leading: const BackButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: IngredientForm(
            ingredient: widget.ingredient,
          )),
    );
  }
}
