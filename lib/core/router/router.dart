import 'package:favorfood/ui/pages/detail/detail.dart';
import 'package:favorfood/ui/pages/filter/filter.dart';
import 'package:favorfood/ui/pages/main/main.dart';
import 'package:favorfood/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // initial Page
  static const String initialRoute = "";

  // Router Map
  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (context) => const MainScreen(),
    MealScreen.routeName: (context) => const MealScreen(),
    DetailScreen.routeName: (context) => const DetailScreen(),
    // FilterScreen.routeName: (context) => const FilterScreen(),
  };

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == FilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (context) => FilterScreen(),
        fullscreenDialog: true,
      );
    }

    return null;
  };

  static final RouteFactory unKnownRoute = (settings) {
    return null;
  };
}