import 'package:favorfood/core/model/meal_model.dart';
import 'package:favorfood/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  final MealModel _meal;
  const DetailContent(this._meal,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildTitle(context, "制作材料"),
          buildMaterial(context),
          buildTitle(context, "步骤"),
          buildSteps(context),
        ],
      ),
    );
  }

  Widget buildBannerImage() {
    return SizedBox(
      width: double.infinity,
      child: Image.network(_meal.imageUrl!)
    );
  }

  Widget buildMaterial(BuildContext context) {
    return buildFrame(
      context: context,
      child: ListView.builder(
        padding: const EdgeInsets.all(0.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients!.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                _meal.ingredients![index],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSteps(BuildContext context) {
    return buildFrame(
      context: context,
      child: ListView.separated(
        padding: const EdgeInsets.all(0.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _meal.steps!.length,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
            // 圆形内容
            leading: CircleAvatar(
              child: Text("#${index+1}"),
            ),
            title: Text(
              _meal.steps![index],
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        },
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeFit.setPx(12.0)),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildFrame({required BuildContext context, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: SizeFit.screenWidth - SizeFit.setPx(40.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
