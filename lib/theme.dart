import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData (BuildContext context){
  return ThemeData.light().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: gray95,
    appBarTheme: const AppBarTheme(),
    iconTheme: const IconThemeData(color: contentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    .apply(bodyColor: contentColorLightTheme, ),
    colorScheme:const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    )
  );
} 

ThemeData darkThemeData (BuildContext context){
  return ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: contentColorLightTheme,
    appBarTheme: const AppBarTheme(),
    iconTheme: const IconThemeData(color: gray100),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    .apply(bodyColor: contentColorDarkTheme),
    colorScheme:const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    )
  );
} 