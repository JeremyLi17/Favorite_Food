import 'package:favorfood/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import '../../../core/model/category_model.dart';
import '../../shared/size_fit.dart';

class HomeCategoryItem extends StatelessWidget {
  CategoryModel _category;

  HomeCategoryItem(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgColor = _category.finalColor;

    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(SizeFit.setPx(12.0)), // 圆角
          gradient: LinearGradient(
            // 渐变
              colors: [
                bgColor.withOpacity(0.5),
                bgColor
              ]
          ),
        ),
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(MealScreen.routeName, arguments: _category);
      },
    );
  }
}