import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryData{

  Future<void> setHistory(String pizzaName, String pizza_id, String orderAmount) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final uid = auth.currentUser!.uid;
    DocumentReference newCityRef = FirebaseFirestore.instance.collection("orderHistory").doc();
    newCityRef.set({'pizzaName': pizzaName, 'pizza_id': pizza_id, "uid": uid, "orderStatus": true, "cookingStatus": false, "orderAmount": orderAmount, "id": newCityRef.id});
    return;
  }

  Stream<List<Map<String, dynamic>>> getUserHistory() async* {
    FirebaseAuth auth = FirebaseAuth.instance;
    final uid = auth.currentUser!.uid;
    yield* FirebaseFirestore.instance
        .collection('orderHistory')
        .where("uid", isEqualTo: uid)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> deleteHistory(id) async {
    final collection = FirebaseFirestore.instance.collection('orderHistory').doc(id).delete();
    return;
  }

}