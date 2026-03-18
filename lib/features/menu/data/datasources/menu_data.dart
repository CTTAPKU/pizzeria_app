import 'package:cloud_firestore/cloud_firestore.dart';

class MenuData {
  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Future<void> setPizza(
      String pizzaName,
      String pizzaSize,
      String pizzaPrice,
      String pizzaDescription,
      String pizzaComposition,
      String pictureURL,
      List<String> extraIngredients) async {
    DocumentReference newCityRef = firestoreInstance.collection("Pizzas").doc();
    newCityRef.set({
      'pizzaName': pizzaName,
      'pizzaSize': pizzaSize,
      "pizzaPrice": pizzaPrice,
      "pizzaDescription": pizzaDescription,
      "pizzaComposition": pizzaComposition,
      "extraIngredients": extraIngredients,
      "pictureURL": pictureURL,
      "id": newCityRef.id
    });
    return;
  }

  Stream<List<Map<String, dynamic>>> getMenuData() async* {
    yield* firestoreInstance
        .collection('Pizzas')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<Map<String, dynamic>> getPizzaData(String id) async {
    final pizza = await firestoreInstance
        .collection('Pizzas')
        .where("id", isEqualTo: id)
        .get();
    return pizza.docs.first.data();
  }
}
