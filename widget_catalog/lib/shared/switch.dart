import 'package:flutter/material.dart';
import 'package:foodie/widgets/shared/switch.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default', type: FdSwitch)
Widget defaultUseCase(BuildContext context) {
  return Center(
    child: FdSwitch(
      isActive: context.knobs.boolean(label: 'Active', initialValue: true),
      onSwitch: (_) => {},
    ),
  );
}
