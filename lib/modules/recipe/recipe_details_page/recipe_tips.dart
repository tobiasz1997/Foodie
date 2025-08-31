import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/utils/utils.dart';

class RecipeTips extends StatelessWidget {
  final List<String> tips;

  const RecipeTips({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                AppLocalizations.of(context)!.tips.firstLetterUppercase(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
        Column(
          children: List.generate(
            tips.length,
            (index) => Padding(
              padding: tips.length == index + 1
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Expanded(child: Text(tips[index])),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
