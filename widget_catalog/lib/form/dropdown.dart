import 'package:flutter/material.dart';
import 'package:foodie/common/models/select.dart';
import 'package:foodie/widgets/shared/form/dropdown.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

var list = [
  new SelectionItem(label: 'test 1', value: 1),
  new SelectionItem(label: 'test 2', value: 2),
  new SelectionItem(label: 'test 3', value: 3),
];

@UseCase(name: 'Default', type: Dropdown)
Widget defaultUseCase(BuildContext context) {
  return Center(child: Dropdown(list: list));
}

@UseCase(name: 'Disabled', type: Dropdown)
Widget disabledUseCase(BuildContext context) {
  return Center(child: Dropdown(list: list, enabled: false));
}

@UseCase(name: 'With placeholder', type: Dropdown)
Widget placeholderUseCase(BuildContext context) {
  return Center(
    child: Dropdown(list: list, placeholder: 'Test'),
  );
}
