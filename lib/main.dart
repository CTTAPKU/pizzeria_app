import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/login/signin.dart';

import 'package:pizzeria_aic/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: signin(),
      theme: theme_data.getAppTheme(),
    ),
  );
}
