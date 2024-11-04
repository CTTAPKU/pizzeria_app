import 'package:flutter/material.dart';
import 'package:pizzeria_aic/widgets/cascading_menu.dart';
import 'package:pizzeria_aic/widgets/pizza_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Меню"),
        centerTitle: true,
        actions: [cascading_menu()],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical:8),
        itemCount: 100,
          itemBuilder: (context, index) {
            return Container(
              margin:EdgeInsets.symmetric(vertical:4),
                child: pizza_card());
          },
      ),
    );
  }
}