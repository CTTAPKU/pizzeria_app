import 'package:flutter/material.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

class settings extends StatefulWidget {
  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
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
        title: const Text("Налаштування"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Темна тема",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  activeColor: Colors.black,
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
