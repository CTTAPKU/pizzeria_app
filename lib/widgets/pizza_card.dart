import 'package:flutter/material.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:pizzeria_aic/screen/order.dart';

class pizza_card extends StatelessWidget {
  const pizza_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      color: Color(0xff697565),
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
                        image: const NetworkImage(
                            "https://www.bora.com/fileadmin/_processed_/2/b/csm_Pizza_1edbbde8a5.jpg"),
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Text(
                        "Margarita",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
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
              side: BorderSide(color: Color(0xffECDFCC))
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => order()));
            },
            child: const Text(
              "Замовити",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
