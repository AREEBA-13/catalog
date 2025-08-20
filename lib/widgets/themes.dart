import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  //light theme

  static ThemeData lighttheme(BuildContext context) => ThemeData(
        useMaterial3: false,
        //primarySwatch: Colors.green,
        textTheme: Theme.of(
          context,
        ).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
        cardColor: Colors.white,
        canvasColor: creamColor,
        colorScheme: ColorScheme.fromSwatch(
          //
          accentColor: darkBluishColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: lightBluishColor,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      );

  //dark theme

  static ThemeData darktheme(BuildContext context) => ThemeData(
        textTheme: Theme.of(
          context,
        ).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
        //brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        colorScheme: ColorScheme.fromSwatch(
          // primarySwatch: Colors.green,
          accentColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: lightBluishColor,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      );
  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color.fromARGB(255, 19, 4, 99);
  static Color lightBluishColor = const Color.fromARGB(255, 129, 76, 182);
}
