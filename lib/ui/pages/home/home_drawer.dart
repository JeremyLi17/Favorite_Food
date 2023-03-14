import 'package:favorfood/ui/pages/filter/filter.dart';
import 'package:favorfood/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildHeaderView(context),
          buildListTile(context, const Icon(Icons.restaurant), "进餐", () {
            Navigator.of(context).pop();
          }),
          buildListTile(context, const Icon(Icons.settings), "过滤", () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeFit.setPx(150.0),
      color: Theme.of(context).primaryColor,
      alignment: Alignment(0,0.5),
      child: Text(
        "Settings",
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title, void Function()? handler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.displayMedium),
      onTap: handler,
    );
  }
}
