import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/l10n/app_localizations.dart';
import 'package:foodie/widgets/shared/buttons/primary_button.dart';

class NoRecipe extends StatefulWidget {
  const NoRecipe({super.key});

  @override
  State<NoRecipe> createState() => _NoRecipeState();
}

class _NoRecipeState extends State<NoRecipe>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutExpo,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: Tween(begin: -0.1, end: 0.1).animate(_animation),
          child: FaIcon(
            FontAwesomeIcons.kitchenSet,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            AppLocalizations.of(context)!.noRecipe,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: PrimaryButton(
            text: AppLocalizations.of(context)!.addRecipe,
            onPressed: () => null,
            fullWidth: false,
          ),
        ),
      ],
    );
  }
}
