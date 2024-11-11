import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/main/profile.dart';
import '../screen/main/history.dart';
import '../screen/main/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  final screens = const [Home(), History(), Profile()];
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
