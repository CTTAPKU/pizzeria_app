import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_aic/Services/history_data.dart';
import 'package:pizzeria_aic/widgets/cascading_menu.dart';
import 'package:pizzeria_aic/widgets/historycard.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Історія"),
        centerTitle: true,
        actions: const [cascading_menu()],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: HistoryData().getUserHistory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List data = snapshot.data as List<Map<String, dynamic>>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return history_card(
                    pizzaName: data[index]["pizzaName"],
                    orderStatus: data[index]["orderStatus"],
                    cookingStatus: data[index]["cookingStatus"],
                    id: data[index]["id"],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
