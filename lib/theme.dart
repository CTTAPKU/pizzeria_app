import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class theme_data {
  static ThemeData getAppTheme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Color(0xffECDFCC)),
          color: const Color(0xff3C3D37),
          titleTextStyle: GoogleFonts.montserratAlternates(
            fontSize: 25,
            color: const Color(0xffECDFCC),
            fontWeight: FontWeight.w500,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xffECDFCC)),
          bodyMedium: TextStyle(color: Color(0xffECDFCC)),
          bodySmall: TextStyle(color: Color(0xffECDFCC)),
        ),
        fontFamily: GoogleFonts.nunito(
          fontWeight: FontWeight.w700,
        ).fontFamily,
        scaffoldBackgroundColor: const Color(0xff1E201E),
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: const Color(0xff3C3D37),
            iconTheme: const WidgetStatePropertyAll<IconThemeData>(
                IconThemeData(color: Color(0xffECDFCC))),
            labelTextStyle: WidgetStateProperty.all(
              GoogleFonts.montserratAlternates(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffECDFCC)),
            ),
            indicatorColor: const Color(0xff697565)),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              GoogleFonts.montserratAlternates(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            foregroundColor: WidgetStatePropertyAll<Color>(Color(0xffECDFCC)),

          ),
        ),
        listTileTheme: ListTileThemeData(
            iconColor: Color(0xffECDFCC), textColor: Color(0xffECDFCC)));
  }
}
