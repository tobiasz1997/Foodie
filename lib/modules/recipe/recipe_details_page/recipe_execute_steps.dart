import 'package:flutter/material.dart';
import 'package:foodie/common/utils/utils.dart';
import 'package:foodie/l10n/app_localizations.dart';

class RecipeExecuteSteps extends StatelessWidget {
  final List<String> steps;

  const RecipeExecuteSteps({super.key, required this.steps});

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
                AppLocalizations.of(context)!.directions.firstLetterUppercase(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
        Column(
          children: List.generate(
            steps.length,
            (index) => Padding(
              padding: steps.length == index + 1
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      (index + 1).toString(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Expanded(child: Text(steps[index])),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
