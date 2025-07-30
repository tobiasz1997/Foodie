import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/shopping_list_ingredient.dart';
import 'package:foodie/common/utils/form_validators.dart';
import 'package:foodie/providers/locale.provider.dart';
import 'package:foodie/providers/shopping_list.provider.dart';
import 'package:foodie/widgets/shared/buttons/primary_button.dart';
import 'package:foodie/widgets/shared/buttons/primary_button_outline.dart';
import 'package:foodie/widgets/shared/form/dropdown.dart';
import 'package:foodie/widgets/shared/form/input.dart';
import 'package:foodie/widgets/shared/toast.dart';
import 'package:provider/provider.dart';

class IngredientForm extends StatefulWidget {
  final ShoppingListIngredient? ingredient;

  const IngredientForm({super.key, this.ingredient});

  @override
  State<IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<IngredientForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionFocusNode = FocusNode();
  late final bool _isEditing;

  int? productId;
  KitchenMeasurement? measurement;
  double? value;
  String? description;

  @override
  void initState() {
    if (widget.ingredient != null) {
      _isEditing = true;
      productId = widget.ingredient!.productId;
      measurement = widget.ingredient!.measurement;
      value = widget.ingredient!.value;
      description = widget.ingredient!.description;
    } else {
      _isEditing = false;
    }
    super.initState();
  }

  void _saveForm(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    if (!_isEditing) {
      Provider.of<ShoppingListProvider>(context, listen: false)
          .addIngredient(
        productId: productId!,
        measurement: measurement!,
        value: value!,
        description: description ?? '',
      )
          .then((value) {
        showToast(
            context, AppLocalizations.of(context)!.successfullyAddedIngredient);
        Navigator.pop(context);
      });
    } else {
      Provider.of<ShoppingListProvider>(context, listen: false)
          .editIngredient(
        ingredientId: widget.ingredient!.id!,
        productId: productId!,
        measurement: measurement!,
        value: value!,
        description: description ?? '',
      )
          .then((value) {
        showToast(context,
            AppLocalizations.of(context)!.successfullyEditedIngredient);
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final langCode =
        Provider.of<LocaleProvider>(context, listen: false).locale.languageCode;
    final productsList =
        Provider.of<ShoppingListProvider>(context, listen: false)
            .getProductsList(lang: langCode);
    final measurementList =
        Provider.of<ShoppingListProvider>(context, listen: false)
            .getMeasurementsList(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Dropdown<int>(
                  placeholder: AppLocalizations.of(context)!.product,
                  list: productsList,
                  initialValue: productId,
                  onSaved: (value) {
                    productId = value as int?;
                  },
                  validator: (value) => requiredValidator(context, value),
                ),
                const SizedBox(height: 10),
                Dropdown<KitchenMeasurement>(
                  placeholder: AppLocalizations.of(context)!.measurementUnit,
                  list: measurementList,
                  initialValue: measurement,
                  onSaved: (value) {
                    measurement = value as KitchenMeasurement;
                  },
                  validator: (value) => requiredValidator(context, value),
                ),
                const SizedBox(height: 10),
                Input(
                  placeholder: AppLocalizations.of(context)!.value,
                  initialValue: value?.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (value) => requiredValidator(context, value),
                  onFiledSubmittedField: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (value) {
                    this.value =
                        double.tryParse(value?.replaceAll(',', '.') ?? '') ?? 0;
                  },
                ),
                const SizedBox(height: 10),
                Input(
                  placeholder: AppLocalizations.of(context)!.description,
                  textInputAction: TextInputAction.go,
                  focusNode: _descriptionFocusNode,
                  initialValue: description,
                  onFiledSubmittedField: (_) => _saveForm(context),
                  onSaved: (value) {
                    description = value;
                  },
                  lines: 2,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: _isEditing
                      ? AppLocalizations.of(context)!.edit
                      : AppLocalizations.of(context)!.add,
                  onPressed: () => _saveForm(context),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PrimaryButtonOutline(
                  text: AppLocalizations.of(context)!.cancel,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
