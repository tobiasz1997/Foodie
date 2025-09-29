import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool disabled;
  final bool fullWidth;
  final bool smallSize;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = true,
    this.smallSize = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: smallSize ? 30 : 50,
      minWidth: fullWidth ? double.infinity : null,
      elevation: 5.0,
      color: disabled
          ? Theme.of(context).colorScheme.onPrimaryContainer
          : Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: () => onPressed(),
      splashColor: Theme.of(
        context,
      ).colorScheme.onSecondaryContainer.withValues(alpha: 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: disabled
                ? Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.labelLarge!.color!.withValues(alpha: 0.5),
                    fontSize: smallSize ? 12 : 18,
                  )
                : Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: smallSize ? 12 : 18,
                  ),
          ),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: FaIcon(
                icon,
                size: 15,
                color: disabled
                    ? Theme.of(
                        context,
                      ).textTheme.labelLarge!.color!.withValues(alpha: 0.5)
                    : Theme.of(context).textTheme.labelLarge!.color,
              ),
            ),
        ],
      ),
    );
  }
}
