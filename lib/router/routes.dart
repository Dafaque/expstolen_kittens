import 'package:exploden_kittens/tools/print.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Map<String, WidgetBuilder> registeredRoutes =
      <String, WidgetBuilder>{};

  static void registerRoute(
    String path,
    WidgetBuilder builder,
  ) {
    if (CustomRouter.registeredRoutes[path] != null) {
      logWarning("dublicate route $path registration!");
      return;
    }
    CustomRouter.registeredRoutes[path] = builder;
  }

  static const String init = "/";
  static const String main = "/main";

  static Route<dynamic>? onGenerateRoute(RouteSettings? settings) {
    if (settings == null) {
      return null;
    }
    WidgetBuilder? builder = CustomRouter.registeredRoutes[settings.name];
    if (builder == null) {
      return null;
    }
    return MaterialPageRoute(builder: builder);
  }
}
