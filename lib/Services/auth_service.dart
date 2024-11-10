import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pizzeria_aic/screen/login/signin.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  Future<void> signUP(
      {required String email,
      required String password,
      required BuildContext context,
      required String firstName, required String lastName, required String phoneNumber,
      }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const signin()),
      );

      CollectionReference users = FirebaseFirestore.instance.collection("Users");
      FirebaseAuth auth = FirebaseAuth.instance;
      final uid = auth.currentUser!.uid;
      users.add({'firstName': firstName, "lastName": lastName, "email": email, "phoneNumber": phoneNumber, "uid": uid});


    } on FirebaseAuthException catch (e) {
      String message = 'Помилка';
      if(e.code == 'weak-password') message = "Ненадійний пароль";
      if(e.code == 'email-already-in-use') message = "Обліковий запис вже існує";
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff3C3D37),
        textColor: const Color(0xffECDFCC),
        fontSize: 16.0,
      );
    } catch (e) {}
  }


  Future<void> signIN(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)  => const nav_bar()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Неправильні облікові дані",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff3C3D37),
        textColor: const Color(0xffECDFCC),
        fontSize: 16.0,
      );
    } catch (e) {}
  }
}