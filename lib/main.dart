import 'package:favorfood/core/viewmodel/favor_view_model.dart';
import 'package:favorfood/core/viewmodel/filter_view_model.dart';
import 'package:favorfood/core/viewmodel/meal_view_model.dart';
import 'package:favorfood/ui/shared/app_theme.dart';
import 'package:favorfood/core/router/router.dart';
import 'package:favorfood/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => FilterViewModel()),
        ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
          create: (context) => MealViewModel(),
          update: (context, filterVM, mealVM) {
            mealVM!.updateFilter(filterVM);
            return mealVM;
          }
        ),
        ChangeNotifierProxyProvider<FilterViewModel, FavorViewModel>(
          create: (context) => FavorViewModel(),
          update: (context, filterVM, favorVM) {
            favorVM!.updateFilter(filterVM);
            return favorVM;
          }
        ),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();

    return MaterialApp(
      title: '美食广场', // android在snapshots中显示

      theme: AppTheme.normalTheme,
      darkTheme: AppTheme.darkTheme,

      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.unKnownRoute,
    );
  }
}

