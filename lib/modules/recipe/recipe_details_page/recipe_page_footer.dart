import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/common/models/recipe.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/l10n/app_localizations.dart';
import 'package:foodie/widgets/shared/buttons/primary_button_outline.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeFooter extends StatelessWidget {
  final Recipe recipe;

  const RecipeFooter({super.key, required this.recipe});

  void _openBrowserURL(String stringUrl) async {
    final Uri url = Uri.parse(stringUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    AppLocalizations.of(context)!.author.firstLetterUppercase(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Text(recipe.author.nickName),
              ],
            ),
            if (recipe.originalUrl != null)
              PrimaryButtonOutline(
                text: AppLocalizations.of(context)!.originalRecipe,
                onPressed: () => _openBrowserURL(recipe.originalUrl!),
                fullWidth: false,
                smallSize: true,
                icon: FontAwesomeIcons.globe,
              ),
          ],
        ),
      ],
    );
  }
}
