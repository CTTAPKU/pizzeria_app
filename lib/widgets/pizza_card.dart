import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/secondary/order.dart';

class PizzaCard extends StatelessWidget {
  final String pizzaName;
  final String pictureURL;
  final String id;

  const PizzaCard({super.key, required this.pizzaName, required this.pictureURL, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      color: const Color(0xff697565),
      child: InkWell(
        splashColor: Colors.white12,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => Order(id: id, pizzaName: pizzaName))),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff1E201E), Colors.transparent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topCenter),
                  ),
                  child: Ink.image(
                    image: NetworkImage(pictureURL),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Text(
                    pizzaName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
