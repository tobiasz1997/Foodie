import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/shopping_list_ingredient.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/modules/shopping_list_page/manage_ingredient_page.dart';
import 'package:foodie/providers/shopping_list.provider.dart';
import 'package:foodie/widgets/shared/dialogs/dialog_info.dart';
import 'package:foodie/widgets/shared/toast.dart';
import 'package:provider/provider.dart';

class IngredientListItem extends StatelessWidget {
  final ShoppingListIngredient ingredient;

  const IngredientListItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    final ingredientsProvider = Provider.of<ShoppingListProvider>(context);

    return Slidable(
      endActionPane: ActionPane(
        key: ValueKey(ingredient.id!),
        motion: const ScrollMotion(),
        dragDismissible: true,
        children: [
          SlidableAction(
            onPressed: (ctx) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManageIngredientPage(
                  ingredient: ingredient,
                ),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (ctx) =>
                ingredientsProvider.removeIngredient(ingredient.id!).then(
                      (value) => showToast(
                          ctx,
                          AppLocalizations.of(context)!
                              .successfullyDeletedIngredient),
                    ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onError,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 5),
        child: Row(
          children: [
            Checkbox(
              value: ingredient.active,
              onChanged: (_) =>
                  ingredientsProvider.setActiveState(ingredient.id!),
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    ingredient.product!.name.pl,
                    style: TextStyle(
                      decoration: ingredient.active
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  if (ingredient.description != null &&
                      ingredient.description!.isNotEmpty)
                    IconButton(
                      onPressed: () => showInfoDialog(
                        context,
                        ingredient.description ?? '',
                        title: AppLocalizations.of(context)!.description,
                      ),
                      iconSize: 15,
                      icon: const Icon(Icons.info_outline),
                    )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  ingredient.value.toFixedString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    decoration: ingredient.active
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    getMeasurementShort(
                      ingredient.measurement,
                      context,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: ingredient.active
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
