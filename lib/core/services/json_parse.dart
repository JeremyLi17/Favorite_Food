import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import '../model/category_model.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    // 1. 加载Json
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2. 将jsonString转成Map/List类型
    final result = json.decode(jsonString);

    // 3. 将Map的内容转换成一个对象
    final resultList = result["category"];
    List<CategoryModel> categories = [];
    for (var cat in resultList) {
      categories.add(CategoryModel.fromJson(cat));
    }

    return categories;
  }
}