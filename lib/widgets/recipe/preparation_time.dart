import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/common/utils/utils.dart';

class PreparationTime extends StatelessWidget {
  final double time;
  final bool icon;

  const PreparationTime({super.key, required this.time, this.icon = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon)
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: FaIcon(
              FontAwesomeIcons.clock,
              size: 15,
            ),
          ),
        if (time >= 1)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              children: [
                Text(
                  time.getHour(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'h',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        Text(
          time.getMinutes(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'm',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
