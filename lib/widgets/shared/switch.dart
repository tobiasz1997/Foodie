import 'package:flutter/material.dart';

class FdSwitch extends StatelessWidget {
  final bool isActive;
  final Function(bool) onSwitch;

  const FdSwitch({super.key, required this.isActive, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeThumbColor: Theme.of(context).colorScheme.primary,
      inactiveThumbColor: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromRGBO(69, 162, 158, 1.0)
          : Theme.of(context).colorScheme.secondary,
      value: isActive,
      onChanged: (value) => onSwitch(value),
    );
  }
}
