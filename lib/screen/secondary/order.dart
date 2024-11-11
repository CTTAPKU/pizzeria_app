import 'package:flutter/material.dart';
import 'package:pizzeria_aic/Services/history_data.dart';
import 'package:pizzeria_aic/Services/menu_data.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

class Order extends StatelessWidget {
  final String id;

const Order({super.key, required this.id});

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
        title: const Text("Замовлення"),
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
                      Image.network(data["pictureURL"]),
                      const SizedBox(height: 15),
                      Text(
                        data["pizzaName"],
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Ціна ${data['pizzaPrice']}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          data["pizzaDiscription"],
                          style: const TextStyle(fontSize: 15),
                        ),
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
