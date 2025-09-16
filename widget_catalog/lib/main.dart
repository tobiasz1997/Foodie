import 'package:flutter/material.dart';
import 'package:foodie/bootstrap/theme/colors/dark_theme.dart';
import 'package:foodie/bootstrap/theme/colors/light_theme.dart';
import 'package:widget_catalog/main.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        AlignmentAddon(),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: LightTheme.lightTheme),
            WidgetbookTheme(name: 'Dark', data: DarkTheme.darkTheme),
          ],
        ),
      ],
    );
  }
}
