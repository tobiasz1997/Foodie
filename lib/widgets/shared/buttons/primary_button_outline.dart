import 'package:flutter/material.dart';

class PrimaryButtonOutline extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool disabled;
  final bool fullWidth;

  const PrimaryButtonOutline({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) => MaterialButton(
        height: 50,
        minWidth: fullWidth ? double.infinity : null,
        elevation: 0.0,
        highlightElevation: 0.0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: disabled
                ? Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.5)
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        onPressed: () => onPressed(),
        splashColor:
            Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
        child: Text(
          text,
          style: disabled
              ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.5),
                    fontSize: 18,
                  )
              : Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
        ),
      );
}
