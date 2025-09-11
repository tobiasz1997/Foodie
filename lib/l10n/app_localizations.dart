import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
  ];

  /// noun - language
  ///
  /// In en, this message translates to:
  /// **'language'**
  String get language;

  /// application dark theme
  ///
  /// In en, this message translates to:
  /// **'dark theme'**
  String get darkTheme;

  /// adj - english
  ///
  /// In en, this message translates to:
  /// **'english'**
  String get english;

  /// adj - polish
  ///
  /// In en, this message translates to:
  /// **'polish'**
  String get polish;

  /// about app - button text showing app info
  ///
  /// In en, this message translates to:
  /// **'about app'**
  String get aboutApp;

  /// description about app and author
  ///
  /// In en, this message translates to:
  /// **'The application was created for the purpose of learning Flutter and Dart. The author is Grzegorz Tobiasz. Feel free to write to me. I encourage you to check my other works and do a code review. All comments will be appreciated. I wish you have a nice day ;)'**
  String get appDescription;

  /// adj - profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @shoppingList.
  ///
  /// In en, this message translates to:
  /// **'Shopping List'**
  String get shoppingList;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'ok'**
  String get ok;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get addProduct;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get editProduct;

  /// No description provided for @ingredient.
  ///
  /// In en, this message translates to:
  /// **'Ingredient'**
  String get ingredient;

  /// No description provided for @customProduct.
  ///
  /// In en, this message translates to:
  /// **'Custom product'**
  String get customProduct;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get productName;

  /// No description provided for @measurementUnit.
  ///
  /// In en, this message translates to:
  /// **'Measurement unit'**
  String get measurementUnit;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'add'**
  String get edit;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @noRecipe.
  ///
  /// In en, this message translates to:
  /// **'no recipe'**
  String get noRecipe;

  /// No description provided for @addRecipe.
  ///
  /// In en, this message translates to:
  /// **'add recipe'**
  String get addRecipe;

  /// No description provided for @successfullyDeletedIngredient.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted ingredient'**
  String get successfullyDeletedIngredient;

  /// No description provided for @successfullyAddedIngredient.
  ///
  /// In en, this message translates to:
  /// **'Successfully added ingredient'**
  String get successfullyAddedIngredient;

  /// No description provided for @successfullyEditedIngredient.
  ///
  /// In en, this message translates to:
  /// **'Successfully edited ingredient'**
  String get successfullyEditedIngredient;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'ingredients'**
  String get ingredients;

  /// No description provided for @directions.
  ///
  /// In en, this message translates to:
  /// **'directions'**
  String get directions;

  /// No description provided for @successfullyAddedIngredientsToShoppingList.
  ///
  /// In en, this message translates to:
  /// **'Successfully added ingredients to shopping list'**
  String get successfullyAddedIngredientsToShoppingList;

  /// No description provided for @onePortion.
  ///
  /// In en, this message translates to:
  /// **'portion'**
  String get onePortion;

  /// No description provided for @fewPortions.
  ///
  /// In en, this message translates to:
  /// **'portions'**
  String get fewPortions;

  /// No description provided for @multiplePortions.
  ///
  /// In en, this message translates to:
  /// **'portions'**
  String get multiplePortions;

  /// No description provided for @addTo.
  ///
  /// In en, this message translates to:
  /// **'add to'**
  String get addTo;

  /// No description provided for @author.
  ///
  /// In en, this message translates to:
  /// **'author'**
  String get author;

  /// No description provided for @originalRecipe.
  ///
  /// In en, this message translates to:
  /// **'original recipe'**
  String get originalRecipe;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'tips'**
  String get tips;

  /// No description provided for @measurementTeaspoonLong.
  ///
  /// In en, this message translates to:
  /// **'teaspoon'**
  String get measurementTeaspoonLong;

  /// No description provided for @measurementTeaspoonShort.
  ///
  /// In en, this message translates to:
  /// **'tsp'**
  String get measurementTeaspoonShort;

  /// No description provided for @measurementTablespoonLong.
  ///
  /// In en, this message translates to:
  /// **'tablespoon'**
  String get measurementTablespoonLong;

  /// No description provided for @measurementTablespoonShort.
  ///
  /// In en, this message translates to:
  /// **'tbsp'**
  String get measurementTablespoonShort;

  /// No description provided for @measurementGlassLong.
  ///
  /// In en, this message translates to:
  /// **'glass'**
  String get measurementGlassLong;

  /// No description provided for @measurementGlassShort.
  ///
  /// In en, this message translates to:
  /// **'glass'**
  String get measurementGlassShort;

  /// No description provided for @measurementMugLong.
  ///
  /// In en, this message translates to:
  /// **'mug'**
  String get measurementMugLong;

  /// No description provided for @measurementMugShort.
  ///
  /// In en, this message translates to:
  /// **'mug'**
  String get measurementMugShort;

  /// No description provided for @measurementLiterLong.
  ///
  /// In en, this message translates to:
  /// **'liter'**
  String get measurementLiterLong;

  /// No description provided for @measurementLiterShort.
  ///
  /// In en, this message translates to:
  /// **'l'**
  String get measurementLiterShort;

  /// No description provided for @measurementMillilitreLong.
  ///
  /// In en, this message translates to:
  /// **'millilitre'**
  String get measurementMillilitreLong;

  /// No description provided for @measurementMillilitreShort.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get measurementMillilitreShort;

  /// No description provided for @measurementGramLong.
  ///
  /// In en, this message translates to:
  /// **'gram'**
  String get measurementGramLong;

  /// No description provided for @measurementGramShort.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get measurementGramShort;

  /// No description provided for @measurementKilogramLong.
  ///
  /// In en, this message translates to:
  /// **'kilogram'**
  String get measurementKilogramLong;

  /// No description provided for @measurementKilogramShort.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get measurementKilogramShort;

  /// No description provided for @measurementPinchLong.
  ///
  /// In en, this message translates to:
  /// **'pinch'**
  String get measurementPinchLong;

  /// No description provided for @measurementPinchShort.
  ///
  /// In en, this message translates to:
  /// **'pinch'**
  String get measurementPinchShort;

  /// No description provided for @measurementHandfulLong.
  ///
  /// In en, this message translates to:
  /// **'handful'**
  String get measurementHandfulLong;

  /// No description provided for @measurementHandfulShort.
  ///
  /// In en, this message translates to:
  /// **'handful'**
  String get measurementHandfulShort;

  /// No description provided for @measurementDropLong.
  ///
  /// In en, this message translates to:
  /// **'drop'**
  String get measurementDropLong;

  /// No description provided for @measurementDropShort.
  ///
  /// In en, this message translates to:
  /// **'dp'**
  String get measurementDropShort;

  /// No description provided for @measurementUnitLong.
  ///
  /// In en, this message translates to:
  /// **'unit'**
  String get measurementUnitLong;

  /// No description provided for @measurementUnitShort.
  ///
  /// In en, this message translates to:
  /// **''**
  String get measurementUnitShort;

  /// No description provided for @mealCategoryBreakfast.
  ///
  /// In en, this message translates to:
  /// **'breakfast'**
  String get mealCategoryBreakfast;

  /// No description provided for @mealCategoryBrunch.
  ///
  /// In en, this message translates to:
  /// **'brunch'**
  String get mealCategoryBrunch;

  /// No description provided for @mealCategoryLunch.
  ///
  /// In en, this message translates to:
  /// **'lunch'**
  String get mealCategoryLunch;

  /// No description provided for @mealCategoryStarter.
  ///
  /// In en, this message translates to:
  /// **'starter'**
  String get mealCategoryStarter;

  /// No description provided for @mealCategoryDinner.
  ///
  /// In en, this message translates to:
  /// **'dinner'**
  String get mealCategoryDinner;

  /// No description provided for @mealCategorySnack.
  ///
  /// In en, this message translates to:
  /// **'snack'**
  String get mealCategorySnack;

  /// No description provided for @mealCategorySoup.
  ///
  /// In en, this message translates to:
  /// **'soup'**
  String get mealCategorySoup;

  /// No description provided for @mealCategorySalad.
  ///
  /// In en, this message translates to:
  /// **'salad'**
  String get mealCategorySalad;

  /// No description provided for @mealCategoryDessert.
  ///
  /// In en, this message translates to:
  /// **'dessert'**
  String get mealCategoryDessert;

  /// No description provided for @mealCategoryBeverages.
  ///
  /// In en, this message translates to:
  /// **'beverages'**
  String get mealCategoryBeverages;

  /// No description provided for @mealCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get mealCategoryOther;

  /// No description provided for @exceptionCodeVE001ErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Must be selected ingredient or typed custom product name'**
  String get exceptionCodeVE001ErrorMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
