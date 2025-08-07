import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/widgets/shared/buttons/primary_button.dart';

void showInfoDialog(BuildContext context, String message, {String title = ''}) {
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
    ),
    content: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        message,
      ),
    ),
    actions: [
      PrimaryButton(
          text: AppLocalizations.of(context)!.ok,
          onPressed: () => Navigator.pop(context))
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
