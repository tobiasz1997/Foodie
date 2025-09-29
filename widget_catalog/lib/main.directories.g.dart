// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widget_catalog/buttons/favourite_button.dart'
    as _widget_catalog_buttons_favourite_button;
import 'package:widget_catalog/buttons/primary_button.dart'
    as _widget_catalog_buttons_primary_button;
import 'package:widget_catalog/buttons/primary_button_outline.dart'
    as _widget_catalog_buttons_primary_button_outline;
import 'package:widget_catalog/form/checkbox.dart'
    as _widget_catalog_form_checkbox;
import 'package:widget_catalog/form/dropdown.dart'
    as _widget_catalog_form_dropdown;
import 'package:widget_catalog/form/input.dart' as _widget_catalog_form_input;
import 'package:widget_catalog/shared/loading.dart'
    as _widget_catalog_shared_loading;
import 'package:widget_catalog/shared/switch.dart'
    as _widget_catalog_shared_switch;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'shared',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'FdSwitch',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _widget_catalog_shared_switch.defaultUseCase,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'Loading',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _widget_catalog_shared_loading.defaultUseCase,
            ),
          ),
          _widgetbook.WidgetbookFolder(
            name: 'buttons',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'FavouriteButton',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Favourite button check',
                    builder: _widget_catalog_buttons_favourite_button
                        .favouriteButtonCheckUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Favourite button not check',
                    builder: _widget_catalog_buttons_favourite_button
                        .favouriteButtonNotCheckUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'PrimaryButton',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _widget_catalog_buttons_primary_button.defaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Disabled',
                    builder:
                        _widget_catalog_buttons_primary_button.disabledUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'No full width',
                    builder: _widget_catalog_buttons_primary_button
                        .noFullWidthUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Small size',
                    builder:
                        _widget_catalog_buttons_primary_button.smallSizeUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With icon',
                    builder: _widget_catalog_buttons_primary_button
                        .withIconSizeUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'PrimaryButtonOutline',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder: _widget_catalog_buttons_primary_button_outline
                        .defaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _widget_catalog_buttons_primary_button_outline
                        .disabledUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'No full width',
                    builder: _widget_catalog_buttons_primary_button_outline
                        .noFullWidthUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Small size',
                    builder: _widget_catalog_buttons_primary_button_outline
                        .smallSizeUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With icon',
                    builder: _widget_catalog_buttons_primary_button_outline
                        .withIconSizeUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'form',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'Dropdown',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder: _widget_catalog_form_dropdown.defaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _widget_catalog_form_dropdown.disabledUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With placeholder',
                    builder: _widget_catalog_form_dropdown.placeholderUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'FormCheckbox',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder: _widget_catalog_form_checkbox.defaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _widget_catalog_form_checkbox.disabledUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'Input',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder: _widget_catalog_form_input.defaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _widget_catalog_form_input.disabledUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With custom keyboard type',
                    builder:
                        _widget_catalog_form_input.customKeyboardTypeUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With placeholder',
                    builder: _widget_catalog_form_input.placeholderUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With text obscured',
                    builder: _widget_catalog_form_input.textObscuredUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With three lines',
                    builder: _widget_catalog_form_input.threeLinesUseCase,
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ],
  )
];
