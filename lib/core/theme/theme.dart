import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  /// Light mode
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.blue,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: Colors.white,
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
      elevation: 6,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 8,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        elevation: MaterialStateProperty.all(8),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    splashColor: Colors.white,
    hintColor: Colors.grey,
    cardColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: Colors.blue,
    shadowColor: Colors.black,
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: Colors.black),
  );

  /// Dark mode

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.grey[800],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: Colors.black,
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
      elevation: 6,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.withOpacity(0.85),
      elevation: 8,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
        elevation: MaterialStateProperty.all(8),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    splashColor: Colors.black,
    hintColor: Colors.grey,
    cardColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[900],
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: Colors.black,
    shadowColor: Colors.black,
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: Colors.white),
  );
}