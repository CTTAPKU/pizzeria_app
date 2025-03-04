import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/login/sign_in.dart';
import 'package:pizzeria_aic/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: const SignIn(),
      theme: CustomThemeData.getAppTheme(),
    ),
  );
}
