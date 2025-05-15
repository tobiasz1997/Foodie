import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:foodie/widgets/shared/page_route_bottom_top_animation/page_route_builder_cupertino.dart';
import 'package:foodie/widgets/shared/page_route_bottom_top_animation/page_route_builder_material.dart';

Route createRoute(Widget page) {
  if (Platform.isIOS) {
    return getPageRouteBuilderCupertino(page);
  } else {
    return getPageRouteBuilderMaterial(page);
  }
}
