import 'package:flutter/material.dart';

import '../../constant/constant_list.dart';

// displayLarge,
// titleSmall
// bodyLarge

/// Light Theme
ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    textTheme: const TextTheme(
      /// Label Text
      displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 14.0,
      ),

      /// Label Text Small
      displaySmall: TextStyle(
        fontSize: 12.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),

      ///  title text
      titleLarge: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),

      /// title medium
      titleMedium: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),

      /// Main Heading
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),

      /// Sub Heading
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),

      /// body text
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.fade,
      ),

      /// body text small
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.fade,
      ),
    ));

/// Dark Theme
ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
