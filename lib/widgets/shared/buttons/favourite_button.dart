import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavouriteButton extends StatelessWidget {
  final bool favourite;
  final Function onPressed;

  const FavouriteButton(this.favourite, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      borderRadius: BorderRadius.circular(12),
      splashColor: Theme.of(context).iconTheme.color!.withValues(alpha: 0.2),
      highlightColor: Theme.of(context).iconTheme.color!.withValues(alpha: 0.1),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: favourite
            ? FaIcon(
                FontAwesomeIcons.solidHeart,
                color: Theme.of(context).colorScheme.error,
                size: 20,
                shadows: [
                  Shadow(
                    offset: const Offset(2, 2),
                    blurRadius: 8,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ],
              )
            : FaIcon(
                FontAwesomeIcons.heart,
                color: Theme.of(context).iconTheme.color,
                size: 20,
                shadows: [
                  Shadow(
                    offset: const Offset(2, 2),
                    blurRadius: 8,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ],
              ),
      ),
    );
  }
}
