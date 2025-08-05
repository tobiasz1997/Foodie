import 'package:flutter/widgets.dart';
import 'package:foodie/modules/home/home_page.dart';
import 'package:foodie/modules/profile/profile_page.dart';
import 'package:foodie/modules/shopping_list/manage_shopping_item_page.dart';
import 'package:foodie/modules/shopping_list/shopping_list_page.dart';

final Map<String, Widget Function(BuildContext)> appRouteMap = {
  homePageRoute: (_) => const HomePage(),
  profilePageRoute: (_) => const ProfilePage(),
  shoppingListPageRoute: (_) => const ShoppingListPage(),
  manageShoppingItemPageRoute: (_) => const ManageShoppingItemPage(),
};

const String homePageRoute = '/home';
const String profilePageRoute = '/profile';
const String shoppingListPageRoute = '/shopping-list';
const String manageShoppingItemPageRoute = '/manage-shopping-item';
