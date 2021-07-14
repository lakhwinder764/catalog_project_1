import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.purple,
      cardColor: Colors.white,
      canvasColor: cream,
      buttonColor: darkblue,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: Theme.of(context).textTheme,
      ));

  static Color cream = Color(0xfff5f5f5);
  static Color darkblue = Color(0xff403b58);
  static Color darkcreamcolor = Vx.gray900;
  static Color lightblue = Vx.purple400;
}
