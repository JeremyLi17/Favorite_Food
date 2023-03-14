import 'package:favorfood/core/viewmodel/favor_view_model.dart';
import 'package:favorfood/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavorContent extends StatelessWidget {
  const FavorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (context, favorVM, child) {
        if (favorVM.favorMeals.isEmpty) {
          return Center(
            child: Text(
              "尚未收藏任何美食",
              style: Theme.of(context).textTheme.displayLarge,
            )
          );
        }
        return ListView.builder(
          itemCount: favorVM.favorMeals.length,
          itemBuilder: (itemContext, index) {
            return MealItem(favorVM.favorMeals[index]);
          }
        );
      },
    );
  }
}
