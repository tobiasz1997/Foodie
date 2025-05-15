import 'package:flutter/material.dart';
import 'package:foodie/widgets/shared/switch.dart';

class SwitchOption extends StatelessWidget {
  final bool switchValue;
  final Function(bool value)? switchChanged;
  final String switchLabel;

  const SwitchOption({super.key, this.switchValue = false, this.switchChanged, this.switchLabel = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FdSwitch(
          isActive: switchValue,
          onSwitch: (value) => switchChanged!(value),
        ),
        Text(
          switchLabel,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
