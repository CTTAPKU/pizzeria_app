import 'package:flutter/material.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:pizzeria_aic/screen/secondary/order.dart';

class pizza_card extends StatelessWidget {
  final String pizzaName;
  final String pictureURL;
  final String id;

  const pizza_card({super.key, required this.pizzaName, required this.pictureURL, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      color: const Color(0xff697565),
      child: ExpansionWidget.autoSaveState(
        initiallyExpanded: false,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
            splashColor: Colors.white12,
            onTap: () => toogleFunction(animated: true),
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
          );
        },
        content: Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.only(right: 20, bottom: 5),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xffECDFCC))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Order(id: id)));

            },
            child: const Text(
              "Замовити",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
