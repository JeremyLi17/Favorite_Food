import 'package:favorfood/core/viewmodel/filter_view_model.dart';
import 'package:favorfood/ui/shared/size_fit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(context),
        buildChoices(),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeFit.setPx(25.0)),
      alignment: Alignment.center,
      child: Text(
        "Your choices",
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildChoices() {
    return Expanded(
      child: Consumer<FilterViewModel>(
        builder: (context, filterVM, child) {
          return ListView(
            children: [
              buildSingleChoice("无谷蛋白","展示无谷蛋白食物", filterVM.isGluntenFree, (value) {
                filterVM.isGluntenFree = value;
              }),
              buildSingleChoice("不含乳糖","展示不含乳糖食物", filterVM.isLactoseFree, (value) {
                filterVM.isLactoseFree = value;
              }),
              buildSingleChoice("普通素食者","展示适合普通素食者的食物", filterVM.isVegetarian, (value) {
                filterVM.isVegetarian = value;
              }),
              buildSingleChoice("严格素食者","展示适合严格素食者的食物", filterVM.isVegan, (value) {
                filterVM.isVegan = value;
              }),
            ],
          );
        }
      ),
    );
  }

  Widget buildSingleChoice(String title, String subtitle, bool buttonValue, void Function(bool)? onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: CupertinoSwitch(
        value: buttonValue,
        onChanged: onChange,
      ),
    );
  }
}
