import 'package:flutter/material.dart';
import '../favor/favor.dart';
import '../home/home.dart';

final List<Widget> pages = [
  const HomeScreen(),
  const FavorScreen(),
];

final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
    label: "首页",
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home),
  ),
  const BottomNavigationBarItem(
    label: "收藏",
    icon: Icon(Icons.star_border),
    activeIcon: Icon(Icons.star),
  ),
];