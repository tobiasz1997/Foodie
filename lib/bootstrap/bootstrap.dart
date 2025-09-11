import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodie/bootstrap/theme/colors/light_theme.dart';
import 'package:foodie/bootstrap/theme/theme.dart';
import 'package:foodie/common/routes/routes.dart';
import 'package:foodie/l10n/app_localizations.dart';
import 'package:foodie/l10n/l10n.dart';
import 'package:foodie/providers/locale.provider.dart';
import 'package:foodie/providers/recipe.provider.dart';
import 'package:foodie/providers/shopping_list.provider.dart';
import 'package:provider/provider.dart';

class Bootstrap extends StatelessWidget {
  const Bootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>.value(
          value: ThemeChanger(LightTheme.lightTheme),
        ),
        ChangeNotifierProvider.value(value: LocaleProvider()),
        ChangeNotifierProvider.value(value: ShoppingListProvider()),
        ChangeNotifierProvider.value(value: RecipeProvider()),
      ],
      child: const BootstrapApp(),
    );
  }
}

class BootstrapApp extends StatefulWidget {
  const BootstrapApp({super.key});

  @override
  State<BootstrapApp> createState() => _BootstrapAppState();
}

class _BootstrapAppState extends State<BootstrapApp> {
  @override
  Widget build(BuildContext context) {
    final localProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'Foodie',
      theme: Provider.of<ThemeChanger>(context).getTheme(),
      locale: localProvider.getLocale,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routes: appRouteMap,
      initialRoute: homePageRoute,
    );
  }
}
