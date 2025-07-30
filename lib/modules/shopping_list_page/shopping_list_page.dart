import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/common/routes/routes.dart';
import 'package:foodie/modules/shopping_list_page/ingredient-list-item.dart';
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
      title: Text(AppLocalizations.of(context)!.shoppingList),
      leading: const BackButton(),
      actions: [
        Builder(
          builder: (ctx) => IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(manageIngredientPageRoute),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ingredientsList =
        Provider.of<ShoppingListProvider>(context).getIngredients;
    return Scaffold(
      appBar: _appBar(context),
      body: ingredientsList.isEmpty
          ? Center(
              child: Text(AppLocalizations.of(context)!.noData),
            )
          : ListView.builder(
              itemCount: ingredientsList.length,
              itemBuilder: (ctx, index) {
                final ingredient = ingredientsList[index];
                return IngredientListItem(
                  ingredient: ingredient,
                );
              },
            ),
    );
  }
}
