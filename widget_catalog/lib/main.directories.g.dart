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
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'shared',
        children: [
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
              )
            ],
          )
        ],
      )
    ],
  )
];
