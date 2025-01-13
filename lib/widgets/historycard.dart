import 'package:flutter/material.dart';
import 'package:pizzeria_aic/Services/history_data.dart';

class HistoryCard extends StatelessWidget {
  final String pizzaName;
  final bool orderStatus;
  final bool cookingStatus;
  final String id;

  const HistoryCard({super.key, required this.pizzaName, required this.orderStatus, required this.cookingStatus, required this.id});

  Text status() {
    if(orderStatus == true && cookingStatus == false) {
      return const Text("Статус: Готується");
    } else if(orderStatus == true && cookingStatus == true) {
      return const Text("Статус: Готово");
    } else {
      return const Text("Статус: Відхилено");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff697565),
      child: InkWell(
        child: ListTile(
          leading: const Icon(Icons.local_pizza),
          title: Text(pizzaName),
          subtitle: status(),
          trailing: IconButton(onPressed: (){HistoryData().deleteHistory(id);}, icon: const Icon(Icons.delete)),
        ),
      ),
    );
  }
}
