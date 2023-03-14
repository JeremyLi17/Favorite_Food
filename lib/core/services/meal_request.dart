import 'package:favorfood/core/model/meal_model.dart';
import 'http_request.dart';

class MealRequest {
  static Future<List<MealModel>> getMealDate() async {
    // 1. 发送网络请求
    const url = "/meal";
    final result = await HttpRequest.request(url);

    // Json转Map/List
    final mealArray = result["meal"];
    List<MealModel> meals = [];
    for (var meal in mealArray) {
      meals.add(MealModel.fromJson(meal));
    }

    return meals;
  }
}