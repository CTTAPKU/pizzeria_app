import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/login/sign_in.dart';
import 'package:pizzeria_aic/theme.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const NavBar();
            }
            if (snapshot.hasError) {
              return Scaffold(body: Text(snapshot.error.toString()));
            }
            return const SignIn();
          }),
      theme: CustomThemeData.getAppTheme(),
    );
  }
}
