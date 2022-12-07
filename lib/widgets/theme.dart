import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        canvasColor: creamColor,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
      );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray800;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lighBluishColor = Vx.purple400;
}
