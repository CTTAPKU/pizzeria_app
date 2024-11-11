import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_aic/Services/history_data.dart';
import 'package:pizzeria_aic/widgets/cascading_menu.dart';
import 'package:pizzeria_aic/widgets/historycard.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Історія"),
        centerTitle: true,
        actions: const [CascadingMenu()],
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
                  return HistoryCard(
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
