import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class theme_data {
  static ThemeData getAppTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: GoogleFonts.montserratAlternates(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      fontFamily: GoogleFonts.nunito(fontWeight: FontWeight.w700).fontFamily,
      scaffoldBackgroundColor: Colors.grey,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        labelTextStyle: WidgetStateProperty.all(
          GoogleFonts.montserratAlternates(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            GoogleFonts.montserratAlternates(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
