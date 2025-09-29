import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/l10n/app_localizations.dart';
import 'package:foodie/widgets/shared/buttons/primary_button.dart';

class RecipeIngredientsActions extends StatefulWidget {
  final int servings;
  final Function(int) onChange;
  final Function() onAddToShoppingList;

  const RecipeIngredientsActions({
    super.key,
    required this.servings,
    required this.onChange,
    required this.onAddToShoppingList,
  });

  @override
  State<RecipeIngredientsActions> createState() =>
      _RecipeIngredientsActionsState();
}

class _RecipeIngredientsActionsState extends State<RecipeIngredientsActions> {
  InkWell _button(BuildContext context, int value, FaIcon icon) => InkWell(
    onTap: () => widget.onChange(value),
    borderRadius: BorderRadius.circular(12),
    splashColor: Theme.of(context).iconTheme.color!.withValues(alpha: 0.2),
    highlightColor: Theme.of(context).iconTheme.color!.withValues(alpha: 0.1),
    child: Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: icon,
    ),
  );

  String _servingsLabel() {
    if (widget.servings == 1) {
      return '${widget.servings} ${AppLocalizations.of(context)!.onePortion}';
    } else if (widget.servings > 1 && widget.servings < 5) {
      return '${widget.servings} ${AppLocalizations.of(context)!.fewPortions}';
    } else {
      return '${widget.servings} ${AppLocalizations.of(context)!.multiplePortions}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _button(
              context,
              1,
              const FaIcon(FontAwesomeIcons.circlePlus, size: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(_servingsLabel()),
            ),
            _button(
              context,
              -1,
              const FaIcon(FontAwesomeIcons.circleMinus, size: 20),
            ),
          ],
        ),
        PrimaryButton(
          text: AppLocalizations.of(context)!.addTo,
          onPressed: () => widget.onAddToShoppingList(),
          fullWidth: false,
          smallSize: true,
          icon: FontAwesomeIcons.basketShopping,
        ),
      ],
    );
  }
}
