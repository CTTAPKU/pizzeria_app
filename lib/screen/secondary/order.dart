import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_aic/Services/history_data.dart';
import 'package:pizzeria_aic/Services/menu_data.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';
import 'dart:math' as math;

class Order extends StatefulWidget {
  final String id;
  final String pizzaName;

  const Order({super.key, required this.id, required this.pizzaName});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<bool> checked = [];

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
        title: Text(widget.pizzaName),
      ),
      body: FutureBuilder(
        future: MenuData().getPizzaData(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data = snapshot.data as Map<String, dynamic>;
            return Container(
              padding: const EdgeInsets.only(top: 8, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              data["pictureURL"],
                              fit: BoxFit.cover,
                            ),
                          ),
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
                            child: Text(
                              "Склад: ${data["pizzaComposition"]}",
                              style: const TextStyle(fontSize: 15),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ExpansionWidget(
                            initiallyExpanded: false,
                            titleBuilder: (double animationValue, _,
                                bool isExpaned, toogleFunction) {
                              return ListTile(
                                onTap: () {
                                  toogleFunction(animated: true);
                                  setState(() {
                                    checked = List<bool>.filled(data["extraIngredients"].length, false);
                                  });
                                  },
                                leading: const Text(
                                  "Додаткові інградієнти",
                                  style: TextStyle(fontSize: 16),
                                ),
                                trailing: Transform.rotate(
                                  angle: math.pi * animationValue / 2,
                                  alignment: Alignment.center,
                                  child:
                                      const Icon(Icons.arrow_right, size: 40),
                                ),
                              );
                            },
                            content: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data["extraIngredients"].length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: checked[index],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          checked[index] = value ?? false;
                                        });
                                      },
                                      checkColor: const Color(0xffECDFCC),
                                      fillColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.disabled)) {
                                            return Colors.transparent;
                                          }
                                          if (states
                                              .contains(WidgetState.selected)) {
                                            return const Color(0xff697565);
                                          }
                                          return Colors.transparent;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            checked[index] = !checked[index];
                                          });
                                        },
                                        child: Text(
                                            data["extraIngredients"][index])),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ціна: ${data['pizzaPrice']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            HistoryData().setHistory(data["pizzaName"],
                                widget.id, data['pizzaPrice']);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Оформити замовлення",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  )
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
