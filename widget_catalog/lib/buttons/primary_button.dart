import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/widgets/shared/buttons/primary_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default', type: PrimaryButton)
Widget defaultUseCase(BuildContext context) {
  return Center(
    child: PrimaryButton(
      text: context.knobs.string(label: 'Label', initialValue: 'Test'),
      onPressed: () => {},
    ),
  );
}

@UseCase(name: 'Disabled', type: PrimaryButton)
Widget disabledUseCase(BuildContext context) {
  return Center(
    child: PrimaryButton(
      text: context.knobs.string(label: 'Label', initialValue: 'Test'),
      onPressed: () => {},
      disabled: true,
    ),
  );
}

@UseCase(name: 'No full width', type: PrimaryButton)
Widget noFullWidthUseCase(BuildContext context) {
  return Center(
    child: PrimaryButton(
      text: context.knobs.string(label: 'Label', initialValue: 'Test'),
      onPressed: () => {},
      fullWidth: false,
    ),
  );
}

@UseCase(name: 'Small size', type: PrimaryButton)
Widget smallSizeUseCase(BuildContext context) {
  return Center(
    child: PrimaryButton(
      text: context.knobs.string(label: 'Label', initialValue: 'Test'),
      onPressed: () => {},
      smallSize: true,
    ),
  );
}

@UseCase(name: 'With icon', type: PrimaryButton)
Widget withIconSizeUseCase(BuildContext context) {
  return Center(
    child: PrimaryButton(
      text: context.knobs.string(label: 'Label', initialValue: 'Test'),
      onPressed: () => {},
      icon: FontAwesomeIcons.warehouse,
    ),
  );
}
