import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/modules/shopping_list/shopping_list_page.dart';
import 'package:foodie/widgets/drawer/drawer.dart';
import 'package:foodie/widgets/shared/page_route_bottom_top_animation/page_route_bottom_top_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: const Text('Foodie App'),
      actions: [
        Builder(
          builder: (ctx) => IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.gear,
            ),
            onPressed: () => Scaffold.of(ctx).openEndDrawer(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      endDrawer: const FdDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Content',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).push(createRoute(const ShoppingListPage())),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        tooltip: AppLocalizations.of(context)!.shoppingList,
        child: const FaIcon(FontAwesomeIcons.basketShopping),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
