import 'package:favorfood/core/services/meal_request.dart';
import 'package:favorfood/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import '../model/meal_model.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];
  FilterViewModel? _filter;

  List<MealModel> get meals {
    return _meals.where((meal) {
      // 过滤
      if (_filter!.isGluntenFree && !meal.isGlutenFree!) return false;
      if (_filter!.isLactoseFree && !meal.isLactoseFree!) return false;
      if (_filter!.isVegetarian && !meal.isVegetarian!) return false;
      if (_filter!.isVegan && !meal.isVegan!) return false;
      return true;
    }).toList();
  }

  List<MealModel> get originalMeals {
    return _meals;
  }

  void updateFilter(FilterViewModel filterVM) {
    _filter = filterVM;
    notifyListeners();
  }

  MealViewModel() {
    MealRequest.getMealDate().then((value) {
      _meals = value;
      // 调用最新的数据进行更新
      notifyListeners();
    });
  }
}