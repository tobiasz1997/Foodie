import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/common/routes/routes.dart';
import 'package:foodie/l10n/app_localizations.dart';
import 'package:foodie/modules/shopping_list/shopping_item.dart';
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
                Navigator.of(context).pushNamed(manageShoppingItemPageRoute),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final shoppingList =
        Provider.of<ShoppingListProvider>(context).getShoppingList;
    return Scaffold(
      appBar: _appBar(context),
      body: shoppingList.isEmpty
          ? Center(
              child: Text(AppLocalizations.of(context)!.noData),
            )
          : ListView.builder(
              itemCount: shoppingList.length,
              itemBuilder: (ctx, index) {
                final item = shoppingList[index];
                return ShoppingItem(
                  item: item,
                );
              },
            ),
    );
  }
}
