import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/login/signin.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  Future<void> signUP(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => signin()),
      );
    } on FirebaseAuthException catch (e) {
    } catch (e) {}
  }

  Future<void> userSetup({required String firstName, required String lastName, required String phoneNumber, required String email}) async {
    CollectionReference users = FirebaseFirestore.instance.collection("Users");
    FirebaseAuth auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid;
    users.add({'firstName': firstName, "lastName": lastName, "email": email, "phoneNumber": phoneNumber, "uid": uid});
    return;
  }

  Future<void> signIN(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)  => nav_bar()));
    } on FirebaseAuthException catch (e) {
    } catch (e) {}
  }
}