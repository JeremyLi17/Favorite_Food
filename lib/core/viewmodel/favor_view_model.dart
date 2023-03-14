import 'package:flutter/material.dart';
import '../model/meal_model.dart';
import 'filter_view_model.dart';

class FavorViewModel extends ChangeNotifier{
  final List<MealModel> _favorMeals = [];
  FilterViewModel? _filter;

  List<MealModel> get favorMeals {
    return originalFavorMeals.where((meal) {
      // 过滤
      if (_filter!.isGluntenFree && !meal.isGlutenFree!) return false;
      if (_filter!.isLactoseFree && !meal.isLactoseFree!) return false;
      if (_filter!.isVegetarian && !meal.isVegetarian!) return false;
      if (_filter!.isVegan && !meal.isVegan!) return false;
      return true;
    }).toList();
  }

  List<MealModel> get originalFavorMeals {
    return _favorMeals;
  }

  void updateFilter(FilterViewModel filterVM) {
    _filter = filterVM;
    notifyListeners();
  }

  void addFavorMeal(MealModel meal) {
    originalFavorMeals.add(meal);
    notifyListeners();
  }

  void removeFavorMeal(MealModel meal) {
    originalFavorMeals.remove(meal);
    notifyListeners();
  }

  void clickFavor(MealModel meal) {
    if (isFavor(meal)) {
      removeFavorMeal(meal);
    } else {
      addFavorMeal(meal);
    }
  }

  bool isFavor(MealModel meal) {
    return originalFavorMeals.contains(meal);
  }
}