import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/shopping_list_item.dart';
import 'package:foodie/common/utils/exception.dart';
import 'package:foodie/common/utils/form_validators.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/providers/locale.provider.dart';
import 'package:foodie/providers/shopping_list.provider.dart';
import 'package:foodie/widgets/shared/buttons/primary_button.dart';
import 'package:foodie/widgets/shared/buttons/primary_button_outline.dart';
import 'package:foodie/widgets/shared/form/checkbox.dart';
import 'package:foodie/widgets/shared/form/dropdown.dart';
import 'package:foodie/widgets/shared/form/input.dart';
import 'package:foodie/widgets/shared/toast.dart';
import 'package:provider/provider.dart';

class ShoppingItemForm extends StatefulWidget {
  final ShoppingListItem? item;

  const ShoppingItemForm({super.key, this.item});

  @override
  State<ShoppingItemForm> createState() => _ShoppingItemFormState();
}

class _ShoppingItemFormState extends State<ShoppingItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _productIdKey = GlobalKey<FormFieldState>();
  final _measurementKey = GlobalKey<FormFieldState>();
  final _descriptionFocusNode = FocusNode();
  late final bool _isEditing;

  int? productId;
  String? customProductName;
  KitchenMeasurement? measurement;
  double? value;
  String? description;

  bool _isCustomProduct = false;

  @override
  void initState() {
    if (widget.item != null) {
      _isEditing = true;
      _isCustomProduct = widget.item!.customName != null &&
          widget.item!.customName!.isNotEmpty &&
          widget.item!.productId == null;
      productId = widget.item!.productId;
      customProductName = widget.item!.customName;
      measurement = widget.item!.measurement;
      value = widget.item!.value;
      description = widget.item!.description;
    } else {
      _isEditing = false;
    }
    super.initState();
  }

  void _handleCustomProductBoolValueChange(bool value) {
    setState(() {
      _isCustomProduct = value;
      if (value == true) {
        _productIdKey.currentState!.reset();
        _measurementKey.currentState!.didChange(KitchenMeasurement.unit);
      }
    });
  }

  void _saveForm(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    if (!_isEditing) {
      Provider.of<ShoppingListProvider>(context, listen: false)
          .addShoppingItem(
        productId: productId,
        customName: customProductName,
        measurement: measurement!,
        value: value!,
        description: description ?? '',
      )
          .then((value) {
        showToast(
            context, AppLocalizations.of(context)!.successfullyAddedIngredient);
        Navigator.pop(context);
      }).catchError((error) {
        showToast(context, error.getMessage(context), type: ToastType.Error);
      }, test: (error) => error is CustomException);
    } else {
      Provider.of<ShoppingListProvider>(context, listen: false)
          .editShoppingItem(
        itemId: widget.item!.id!,
        productId: productId,
        customName: customProductName,
        measurement: measurement!,
        value: value!,
        description: description ?? '',
      )
          .then((value) {
        showToast(context,
            AppLocalizations.of(context)!.successfullyEditedIngredient);
        Navigator.pop(context);
      }).catchError((error) {
        showToast(context, error.getMessage(context), type: ToastType.Error);
      }, test: (error) => error is CustomException);
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Dropdown<int>(
                    fieldKey: _productIdKey,
                    placeholder: AppLocalizations.of(context)!.ingredient,
                    list: productsList,
                    initialValue: productId,
                    enabled: !_isCustomProduct,
                    onSaved: (value) {
                      productId = value as int?;
                    },
                    validator: (value) => _isCustomProduct
                        ? null
                        : requiredValidator(context, value),
                  ),
                  const SizedBox(height: 10),
                  FormCheckbox(
                    label: AppLocalizations.of(context)!.customProduct,
                    initialValue: _isCustomProduct,
                    onChange: (val) =>
                        _handleCustomProductBoolValueChange(val!),
                  ),
                  const SizedBox(height: 10),
                  if (_isCustomProduct)
                    Input(
                      placeholder: AppLocalizations.of(context)!.productName,
                      initialValue: customProductName,
                      textInputAction: TextInputAction.next,
                      validator: (value) => _isCustomProduct
                          ? requiredValidator(context, value)
                          : null,
                      onSaved: (value) {
                        customProductName = value;
                      },
                    ),
                  if (_isCustomProduct) const SizedBox(height: 10),
                  Dropdown<KitchenMeasurement>(
                    fieldKey: _measurementKey,
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
                    initialValue: value?.toFixedString(),
                    textInputAction: TextInputAction.next,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) => requiredValidator(context, value),
                    onFiledSubmittedField: (_) {
                      FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode);
                    },
                    onSaved: (value) {
                      this.value = value?.doubleParse() ?? 0;
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
