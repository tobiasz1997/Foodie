import 'package:flutter/material.dart';
import 'package:foodie/l10n/app_localizations.dart';
import 'package:foodie/l10n/l10n.dart';
import 'package:foodie/providers/locale.provider.dart';
import 'package:provider/provider.dart';

class LanguageOption extends StatelessWidget {
  const LanguageOption({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final locale = localeProvider.getLocale;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        DropdownButton(
          value: locale,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).colorScheme.primary,
          ),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          underline: Container(
            height: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
          onChanged: (_) {},
          items: L10n.all.map(
            (value) {
              final country = L10n.getCountry(value.languageCode, context);
              return DropdownMenuItem(
                value: value,
                child: Text(country),
                onTap: () {
                  localeProvider.setLocale(value);
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
