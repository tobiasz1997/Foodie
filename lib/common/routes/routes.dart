import 'package:flutter/widgets.dart';
import 'package:foodie/modules/home_page/home_page.dart';
import 'package:foodie/modules/profile_page/profile_page.dart';
import 'package:foodie/modules/shopping_list_page/manage_ingredient_page.dart';
import 'package:foodie/modules/shopping_list_page/shopping_list_page.dart';

final Map<String, Widget Function(BuildContext)> appRouteMap = {
  homePageRoute: (_) => const HomePage(),
  profilePageRoute: (_) => const ProfilePage(),
  shoppingListPageRoute: (_) => const ShoppingListPage(),
  manageIngredientPageRoute: (_) => const ManageIngredientPage(),
};

const String homePageRoute = '/home';
const String profilePageRoute = '/profile';
const String shoppingListPageRoute = '/shopping-list';
const String manageIngredientPageRoute = '/manage-ingredient';
