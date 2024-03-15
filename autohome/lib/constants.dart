import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 96, fontWeight: FontWeight.w300, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 60, fontWeight: FontWeight.w400, color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black),
    headlineMedium: TextStyle(
        fontSize: 34, fontWeight: FontWeight.w400, color: Colors.black),
    headlineSmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
    bodySmall:
        TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.red),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
  ),
);


TextStyle kHeadingLarge({double? fontSize}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Colors.black,
    letterSpacing: .5,
    fontSize: fontSize ?? 18,
    fontWeight: FontWeight.w500,
  ),
);

TextStyle kBodySmall({double? fontSize, Color? color, double? letterSpacing}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: color ?? Colors.black,
    letterSpacing: letterSpacing ?? 0.5,
    fontSize: fontSize ?? 18,
    fontWeight: FontWeight.w300,
  ),
);

TextStyle kBodyLarge({double? fontSize}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Colors.black,
    letterSpacing: .5,
    fontSize: fontSize ?? 18,
    fontWeight: FontWeight.w600,
  ),
);

TextStyle kSubHeadingLarge({double? fontSize, Color? color}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: color ??Colors.black,
    letterSpacing: .5,
    fontSize: fontSize ?? 18,
    fontWeight: FontWeight.w400,
  ),
);

TextStyle kSubHeadingSmall({double? fontSize}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Colors.black,
    letterSpacing: .5,
    fontSize: fontSize ?? 18,
    fontWeight: FontWeight.w300,
  ),
);

TextStyle kModeScrollHeading({double? fontSize}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Colors.green.shade700,
    letterSpacing: .5,
    fontSize: fontSize ?? 22,
    fontWeight: FontWeight.w500,
  ),
);


