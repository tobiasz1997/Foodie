import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie/common/models/shopping_list_item.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/l10n/translations/measurement.dart';
import 'package:foodie/modules/shopping_list/manage_shopping_item_page.dart';
import 'package:foodie/providers/locale.provider.dart';
import 'package:foodie/providers/shopping_list.provider.dart';
import 'package:foodie/widgets/shared/dialogs/dialog_info.dart';
import 'package:foodie/widgets/shared/toast.dart';
import 'package:provider/provider.dart';

class ShoppingItem extends StatelessWidget {
  final ShoppingListItem item;

  const ShoppingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ShoppingListProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Slidable(
      endActionPane: ActionPane(
        key: ValueKey(item.id!),
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManageShoppingItemPage(
                  item: item,
                ),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (ctx) => itemsProvider.deleteShoppingItem(item.id!).then(
                  (value) => showToast(
                    ctx,
                    AppLocalizations.of(context)!.successfullyDeletedIngredient,
                  ),
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
              value: !item.active,
              onChanged: (_) => itemsProvider.setActiveState(item.id!),
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    item.product != null
                        ? localeProvider.locale.toString() == 'pl'
                            ? item.product!.name.pl
                            : item.product!.name.en
                        : item.customName!.firstLetterUppercase(),
                    style: TextStyle(
                      decoration: !item.active
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  if (item.description != null && item.description!.isNotEmpty)
                    IconButton(
                      onPressed: () => showInfoDialog(
                        context,
                        item.description ?? '',
                        title: AppLocalizations.of(context)!.description,
                      ),
                      iconSize: 15,
                      icon: Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  item.value.toFixedString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    decoration: !item.active
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    getMeasurementShort(
                      item.measurement,
                      context,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: !item.active
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
