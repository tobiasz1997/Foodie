import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/models/ingredient.dart';

String getMeasurementShort(KitchenMeasurement key, BuildContext context) {
  switch (key) {
    case KitchenMeasurement.teaspoon:
      return AppLocalizations.of(context)!.measurementTeaspoonShort;
    case KitchenMeasurement.tablespoon:
      return AppLocalizations.of(context)!.measurementTablespoonShort;
    case KitchenMeasurement.glass:
      return AppLocalizations.of(context)!.measurementGlassShort;
    case KitchenMeasurement.mug:
      return AppLocalizations.of(context)!.measurementMugShort;
    case KitchenMeasurement.liter:
      return AppLocalizations.of(context)!.measurementLiterShort;
    case KitchenMeasurement.millilitre:
      return AppLocalizations.of(context)!.measurementMillilitreShort;
    case KitchenMeasurement.gram:
      return AppLocalizations.of(context)!.measurementGramShort;
    case KitchenMeasurement.kilogram:
      return AppLocalizations.of(context)!.measurementKilogramShort;
    case KitchenMeasurement.pinch:
      return AppLocalizations.of(context)!.measurementPinchShort;
    case KitchenMeasurement.handful:
      return AppLocalizations.of(context)!.measurementHandfulShort;
    case KitchenMeasurement.drop:
      return AppLocalizations.of(context)!.measurementDropShort;
    case KitchenMeasurement.unit:
      return AppLocalizations.of(context)!.measurementUnitShort;
    default:
      return AppLocalizations.of(context)!.measurementUnitShort;
  }
}

String getMeasurementLong(KitchenMeasurement key, BuildContext context) {
  switch (key) {
    case KitchenMeasurement.teaspoon:
      return AppLocalizations.of(context)!.measurementTeaspoonLong;
    case KitchenMeasurement.tablespoon:
      return AppLocalizations.of(context)!.measurementTablespoonLong;
    case KitchenMeasurement.glass:
      return AppLocalizations.of(context)!.measurementGlassLong;
    case KitchenMeasurement.mug:
      return AppLocalizations.of(context)!.measurementMugLong;
    case KitchenMeasurement.liter:
      return AppLocalizations.of(context)!.measurementLiterLong;
    case KitchenMeasurement.millilitre:
      return AppLocalizations.of(context)!.measurementMillilitreLong;
    case KitchenMeasurement.gram:
      return AppLocalizations.of(context)!.measurementGramLong;
    case KitchenMeasurement.kilogram:
      return AppLocalizations.of(context)!.measurementKilogramLong;
    case KitchenMeasurement.pinch:
      return AppLocalizations.of(context)!.measurementPinchLong;
    case KitchenMeasurement.handful:
      return AppLocalizations.of(context)!.measurementHandfulLong;
    case KitchenMeasurement.drop:
      return AppLocalizations.of(context)!.measurementDropLong;
    case KitchenMeasurement.unit:
      return AppLocalizations.of(context)!.measurementUnitLong;
    default:
      return AppLocalizations.of(context)!.measurementUnitLong;
  }
}
