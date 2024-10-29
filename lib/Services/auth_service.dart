import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/login/signin.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

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
      String message = "";
      if (e.code == "week-password")
        message = "Закороткий пароль";
      else if (e.code == "email-already-in-use")
        message = "Акаунт з цією поштою вже існує";
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)  => nav_bar()));
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "week-password")
        message = "Закороткий пароль";
      else if (e.code == "email-already-in-use")
        message = "Акаунт з цією поштою вже існує";
    } catch (e) {}
  }
}
