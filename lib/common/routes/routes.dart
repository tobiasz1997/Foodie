import 'package:flutter/widgets.dart';
import 'package:foodie/modules/home_page/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRouteMap = {
  homePageRoute: (_) => const MyHomePage(title: 'Foodie app',),
};

const String homePageRoute = '/home';