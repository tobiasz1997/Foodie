import 'package:flutter/material.dart';
import 'package:foodie/widgets/shared/form/input.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default', type: Input)
Widget defaultUseCase(BuildContext context) {
  return const Center(child: Input());
}

@UseCase(name: 'Disabled', type: Input)
Widget disabledUseCase(BuildContext context) {
  return const Center(child: Input(keyboardType: TextInputType.number));
}

@UseCase(name: 'With placeholder', type: Input)
Widget placeholderUseCase(BuildContext context) {
  return const Center(child: Input(placeholder: 'Test'));
}

@UseCase(name: 'With text obscured', type: Input)
Widget textObscuredUseCase(BuildContext context) {
  return const Center(child: Input(isTextObscured: true));
}

@UseCase(name: 'With three lines', type: Input)
Widget threeLinesUseCase(BuildContext context) {
  return const Center(child: Input(lines: 3));
}

@UseCase(name: 'With custom keyboard type', type: Input)
Widget customKeyboardTypeUseCase(BuildContext context) {
  return const Center(child: Input(keyboardType: TextInputType.number));
}
