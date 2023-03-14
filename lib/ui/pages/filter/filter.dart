import 'filter_content.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = "/filter";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食过滤"),
      ),
      body: FilterContent(),
    );
  }
}
