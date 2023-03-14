import 'package:favorfood/core/model/category_model.dart';
import 'package:favorfood/core/viewmodel/meal_view_model.dart';
import 'package:favorfood/ui/widgets/meal_item.dart';
import 'package:flutter/foundation.dart';
import '../../../core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MealContent extends StatelessWidget {
  const MealContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Selector<MealViewModel, List<MealModel>>(
      // selector用于过滤
      selector: (context, mealVM) => mealVM.meals.where((meal) => meal.categories!.contains(category.id)).toList(),
      // shouldRebuild是否重新build
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (context, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(meals[index]);
          },
        );
      },
    );
  }
}

