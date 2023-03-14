import 'package:favorfood/core/model/category_model.dart';
import 'package:favorfood/core/services/json_parse.dart';
import 'package:favorfood/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'home_category_item.dart';

class HomeContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final categories = snapshot.data;
        return GridView.builder(
            padding: EdgeInsets.all(SizeFit.setPx(20.0)),
            itemCount: categories?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: SizeFit.setPx(20.0),
              mainAxisSpacing: SizeFit.setPx(20.0),
              childAspectRatio: 1.5, // width / height
            ),
            itemBuilder: (context, index) {
              return HomeCategoryItem(categories![index]);
            }
        );
      }
    );
  }
}


