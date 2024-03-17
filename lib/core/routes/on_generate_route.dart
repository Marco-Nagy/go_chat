import 'package:flutter/material.dart';
import 'package:go_chat/core/routes/app_route.dart';
import 'package:go_chat/features/Home/presentation/pages/home_screen.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    switch (name) {
      case AppRouter.homePage:
        return materialPageBuilder(const HomeScreen());
      default:
    }
  }


}
materialPageBuilder(Widget child) => MaterialPageRoute(
  builder: (context) => child,
);