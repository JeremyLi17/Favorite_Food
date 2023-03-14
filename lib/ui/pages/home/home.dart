import 'home_drawer.dart';
import 'home_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食广场"),
        leading: IconButton(
            icon: const Icon(Icons.mode_standby),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          )
        ),
      body: HomeContent(),
    );
  }
}
