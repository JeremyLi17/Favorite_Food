import 'package:favorfood/core/model/meal_model.dart';
import 'package:favorfood/core/viewmodel/favor_view_model.dart';
import 'package:favorfood/ui/pages/detail/detail.dart';
import 'package:favorfood/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/size_fit.dart';

class MealItem extends StatelessWidget {
  final MealModel meal;
  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(SizeFit.setPx(10.0)),
        elevation: 4, // 阴影
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeFit.setPx(12.0))), //圆角
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeFit.setPx(12.0)),
              topRight: Radius.circular(SizeFit.setPx(12.0)),
          ),
          child: Image.network(
              meal.imageUrl!,
              width: double.infinity,
              height: SizeFit.setPx(250.0),
              fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: SizeFit.setPx(10.0),
          bottom: SizeFit.setPx(10.0),
          child: Container(
            width: SizeFit.setPx(400.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              meal.title!,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(SizeFit.setPx(16.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OperationItem(const Icon(Icons.schedule), "${meal.duration} mins"),
          OperationItem(const Icon(Icons.restaurant), "${meal.complexStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<FavorViewModel>(
      builder: (context, favorVM, child) {
        final iconData = favorVM.isFavor(meal)? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(meal)? Colors.red : Colors.black;
        final textData = favorVM.isFavor(meal)? "已收藏" : "未收藏";
        return GestureDetector(
          child: OperationItem(Icon(iconData, color: iconColor),textData),
          onTap: () {
            favorVM.clickFavor(meal);
          },
        );
      },
    );
  }
}
