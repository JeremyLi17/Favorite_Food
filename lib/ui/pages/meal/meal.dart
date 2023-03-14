import 'package:favorfood/core/model/category_model.dart';
import 'package:favorfood/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({Key? key}) : super(key: key);
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    // 获取传递过来的参数
    final category = ModalRoute.of(context)?.settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: MealContent(),
      ),
    );
  }
}
