import 'package:flutter/material.dart';
import 'package:foodie/widgets/shared/form/checkbox.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default', type: FormCheckbox)
Widget defaultUseCase(BuildContext context) {
  return Center(
    child: FormCheckbox(
      label: context.knobs.string(label: 'Label', initialValue: 'Test'),
      initialValue: context.knobs.boolean(label: 'value'),
      onChange: (bool? p1) {},
    ),
  );
}

@UseCase(name: 'Disabled', type: FormCheckbox)
Widget disabledUseCase(BuildContext context) {
  return Center(
    child: FormCheckbox(
      label: context.knobs.string(label: 'Label', initialValue: 'Test'),
      initialValue: context.knobs.boolean(label: 'value'),
      enabled: false,
      onChange: (bool? p1) {},
    ),
  );
}
