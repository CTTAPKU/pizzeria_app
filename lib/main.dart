import 'package:flutter/material.dart';
import 'package:pizzeria_aic/theme.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: nav_bar(),
      theme: theme_data.getAppTheme(),
    ),
  );
}
