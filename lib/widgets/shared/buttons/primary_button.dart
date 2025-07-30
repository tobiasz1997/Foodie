import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool disabled;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      elevation: 5.0,
      color: disabled
          ? Theme.of(context).colorScheme.onPrimaryContainer
          : Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: () => onPressed(),
      splashColor:
          Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.5),
      child: Text(
        text,
        style: disabled
            ? Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .color!
                    .withOpacity(0.5),
                fontSize: 18)
            : Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18),
      ),
    );
  }
}
