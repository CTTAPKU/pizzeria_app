import 'package:flutter/material.dart';
import 'package:pizzeria_aic/Services/history_data.dart';
import 'package:pizzeria_aic/Services/menu_data.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

class Order extends StatelessWidget {
  final String id;
  final String pizzaName;

const Order({super.key, required this.id, required this.pizzaName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const NavBar()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: Text(pizzaName),
      ),
      body: FutureBuilder(
        future: MenuData().getPizzaData(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data = snapshot.data as Map<String, dynamic>;
            return Container(
              padding: const EdgeInsets.only(top: 8, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 200, width: MediaQuery.of(context).size.width,child: Image.network(data["pictureURL"], fit: BoxFit.cover,)),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          data["pizzaDescription"],
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Склад: ${data["pizzaComposition"]}",
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Ціна ${data['pizzaPrice']}",
                        style: const TextStyle(fontSize: 20),
                      ),

                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        HistoryData().setHistory(data["pizzaName"], id, data['pizzaPrice']);
                        Navigator.pop(context);
                      }, child: const Text("Оформити замовлення"))
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
