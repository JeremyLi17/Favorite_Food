import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier{
  // 无谷蛋白
  bool _isGluntenFree = false;
  // 乳糖
  bool _isLactoseFree = false;

  bool _isVegetarian = false;
  bool _isVegan = false;

  bool get isGluntenFree => _isGluntenFree;

  bool get isVegan => _isVegan;

  bool get isVegetarian => _isVegetarian;

  bool get isLactoseFree => _isLactoseFree;

  set isGluntenFree(bool value) {
    _isGluntenFree = value;
    notifyListeners();
  }

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }
}