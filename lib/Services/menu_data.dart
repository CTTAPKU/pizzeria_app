import 'package:cloud_firestore/cloud_firestore.dart';

class MenuData {
  Future<void> setPizza(String pizzaName, String pizzaSize, String pizzaPrice, String pizzaDescription, String pizzaComposition, String pictureURL) async {
    DocumentReference newCityRef = FirebaseFirestore.instance.collection("Pizzas").doc();
    newCityRef.set({
      'pizzaName': pizzaName,
      'pizzaSize': pizzaSize,
      "pizzaPrice": pizzaPrice,
      "pizzaDescription": pizzaDescription,
      "pizzaComposition": pizzaComposition,
      "pictureURL": pictureURL,
      "id": newCityRef.id
    });
    return;
  }

  Stream<List<Map<String, dynamic>>> getMenuData() async* {
    yield* FirebaseFirestore.instance
        .collection('Pizzas')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<Map<String, dynamic>> getPizzaData(String id) async {
    final pizza = await FirebaseFirestore.instance.collection('Pizzas').where("id", isEqualTo: id).get();
    return pizza.docs.first.data();
  }
}
