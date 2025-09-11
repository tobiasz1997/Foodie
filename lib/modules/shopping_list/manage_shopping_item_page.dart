import 'package:flutter/material.dart';
import 'package:foodie/common/models/shopping_list_item.dart';
import 'package:foodie/l10n/app_localizations.dart';
import 'package:foodie/modules/shopping_list/shopping_item_form.dart';

class ManageShoppingItemPage extends StatefulWidget {
  final ShoppingListItem? item;

  const ManageShoppingItemPage({super.key, this.item});

  @override
  State<ManageShoppingItemPage> createState() => _ManageShoppingItemPageState();
}

class _ManageShoppingItemPageState extends State<ManageShoppingItemPage> {
  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(
        widget.item != null
            ? AppLocalizations.of(context)!.editProduct
            : AppLocalizations.of(context)!.addProduct,
      ),
      leading: const BackButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ShoppingItemForm(
            item: widget.item,
          ),
        ),
      ),
    );
  }
}
