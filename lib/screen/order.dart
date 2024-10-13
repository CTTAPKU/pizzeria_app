import 'package:flutter/material.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

class order extends StatefulWidget {
  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const nav_bar()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text("Замовлення"),
      ),
      body: Container(),
    );
  }
}