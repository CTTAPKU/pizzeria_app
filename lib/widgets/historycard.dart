import 'package:flutter/material.dart';

class history_card extends StatelessWidget {
  const history_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff697565),
      child: InkWell(
        onTap: () {

        },
        child: ListTile(
          leading: Icon(Icons.local_pizza),
          title: Text("Назва"),
          subtitle: Text("Опис"),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
