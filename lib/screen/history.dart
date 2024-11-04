import 'package:flutter/material.dart';
import 'package:pizzeria_aic/widgets/cascading_menu.dart';
import 'package:pizzeria_aic/widgets/historycard.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
            ),
        title: const Text("Історія"),
        centerTitle: true,
        actions: [cascading_menu()],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical:8),
          child: history_card()),
    );
  }
}
