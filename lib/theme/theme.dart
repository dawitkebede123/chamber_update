import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: 'Poppins',
//  brightness: Brightness.light,
 colorScheme: ColorScheme.light(
  background: Colors.white,
  primary: Colors.black
 )
);
ThemeData darkMode = ThemeData(
   fontFamily: 'Poppins',
  //  brightness: Brightness.dark,
   colorScheme: ColorScheme.light(
  background: Colors.grey.shade900,
  primary: Colors.white
 )
);