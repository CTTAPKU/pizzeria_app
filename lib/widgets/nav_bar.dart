import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/main/profile.dart';
import '../screen/main/history.dart';
import '../screen/main/home.dart';

class nav_bar extends StatefulWidget {
  const nav_bar({super.key});

  @override
  State<nav_bar> createState() => _nav_barState();
}

class _nav_barState extends State<nav_bar> {
  int currentPageIndex = 0;
  final screens = const [Home(), history(), profile()];
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: "Меню",
          ),
          NavigationDestination(icon: Icon(Icons.bookmark), label: "Історія"),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined), label: "Профіль")
        ],
      ),
      body: screens[currentPageIndex],
    );
  }
}
