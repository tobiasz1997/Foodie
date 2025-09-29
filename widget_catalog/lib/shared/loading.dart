import 'package:flutter/material.dart';
import 'package:foodie/widgets/shared/loading.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default', type: Loading)
Widget defaultUseCase(BuildContext context) {
  return const Center(child: Loading());
}
