import 'package:flutter/material.dart';
import 'package:foodie/widgets/shared/buttons/favourite_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Favourite button check', type: FavouriteButton)
Widget favouriteButtonCheckUseCase(BuildContext context) {
  return Center(child: FavouriteButton(true, () => {}));
}

@widgetbook.UseCase(name: 'Favourite button not check', type: FavouriteButton)
Widget favouriteButtonNotCheckUseCase(BuildContext context) {
  return Center(child: FavouriteButton(false, () => {}));
}
