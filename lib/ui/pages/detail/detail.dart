import 'package:favorfood/core/model/meal_model.dart';
import 'package:favorfood/core/viewmodel/favor_view_model.dart';
import 'package:favorfood/ui/pages/detail/detail_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: DetailContent(meal),
      floatingActionButton: Consumer<FavorViewModel>(
        builder: (context, favorVM, child) {
          final iconData = favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
          final iconColor = favorVM.isFavor(meal) ? Colors.red : Colors.black;

          return FloatingActionButton(
            child: Icon(
              iconData,
              color: iconColor,
            ),
            onPressed: () {
              favorVM.clickFavor(meal);
            },
          );
        },
      ),
    );
  }
}
