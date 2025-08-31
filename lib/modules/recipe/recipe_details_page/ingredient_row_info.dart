import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/l10n/translations/measurement.dart';
import 'package:foodie/providers/locale.provider.dart';
import 'package:foodie/widgets/shared/dialogs/dialog_info.dart';
import 'package:provider/provider.dart';

class IngredientRowItem extends StatefulWidget {
  final Ingredient ingredient;
  final Function(int) onActiveChange;

  const IngredientRowItem({
    super.key,
    required this.ingredient,
    required this.onActiveChange,
  });

  @override
  State<IngredientRowItem> createState() => _IngredientRowItemState();
}

class _IngredientRowItemState extends State<IngredientRowItem> {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Checkbox(
            value: widget.ingredient.active,
            onChanged: (_) => widget.onActiveChange(widget.ingredient.id),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  localeProvider.locale.toString() == 'pl'
                      ? widget.ingredient.product.name.pl
                      : widget.ingredient.product.name.en,
                  style: TextStyle(
                    color: widget.ingredient.active
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.5)
                        : Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
                if (widget.ingredient.description != null &&
                    widget.ingredient.description!.isNotEmpty)
                  IconButton(
                    onPressed: () => showInfoDialog(
                      context,
                      widget.ingredient.description ?? '',
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
                widget.ingredient.value.toFixedString(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: widget.ingredient.active
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  getMeasurementShort(
                    widget.ingredient.measurement,
                    context,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: widget.ingredient.active
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.5)
                        : Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
