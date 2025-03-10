import 'package:flutter/material.dart';
import 'package:foodie/bootstrap/theme/colors/light_theme.dart';
import 'package:foodie/bootstrap/theme/theme.dart';
import 'package:foodie/common/routes/routes.dart';
import 'package:provider/provider.dart';

class Bootstrap extends StatelessWidget {
  const Bootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ThemeChanger>.value(value: ThemeChanger(LightTheme.lightTheme)),
    ], child: const BootstrapApp());
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

    return MaterialApp(
      title: 'Foodie',
      theme: Provider.of<ThemeChanger>(context).getTheme(),
      routes: appRouteMap,
      initialRoute: homePageRoute,
    );
  }
}
