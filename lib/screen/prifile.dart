import 'package:flutter/material.dart';
import '../widgets/cascading_menu.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
        title: const Text("Профіль"),
        centerTitle: true,
        actions: [cascading_menu()],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 15),
            child: const CircleAvatar(
              radius: 83,
              child: Text("avatar"),
            ),
          ),
          Text("ПІБ"),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Divider(),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text("Ваші бонуси"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Доступні"),
              Text("Всього"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("0"),
              Text("0"),
            ],
          )
        ],
      ),
    );
  }
}
