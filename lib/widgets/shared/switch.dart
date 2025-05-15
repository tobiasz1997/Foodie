import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bootstrap/theme/theme.dart';

class FdSwitch extends StatelessWidget {
  final bool isActive;
  final Function(bool) onSwitch;

  const FdSwitch({super.key, required this.isActive, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return Switch(
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveThumbColor: themeChanger.isDarkTheme()
          ? const Color.fromRGBO(69, 162, 158, 1.0)
          : Theme.of(context).colorScheme.secondary,
      value: isActive,
      onChanged: (value) => onSwitch(value),
    );
  }
}
