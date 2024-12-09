import 'package:flutter/material.dart';

var primaryTheme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.blue,
  primaryColor: const Color(0xFF6EC1E4),
  fontFamily: "Geomanist",
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFF2F2F2)),
    bodyMedium: TextStyle(color: Color(0xFFF2F2F2)),
    bodySmall: TextStyle(color: Color(0xFFF2F2F2)),
  ),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF6EC1E4),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Color(0xFFF2F2F2),
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    iconTheme: IconThemeData(color: Color(0xFFF2F2F2)),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF6EC1E4),
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6EC1E4),
    onPrimary: Color(0xFFF2F2F2),
    secondary: Color(0xFF6EC1E4),
    onSecondary: Color(0xFFF2F2F2),
    error: Color(0xFFD32F2F),
    onError: Color(0xFFF2F2F2),
    onSurface: Color(0xFFF2F2F2),
    surface: Color(0xFF6EC1E4),
  ),
  // Change input text color
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Color(0xFFF2F2F2)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF6EC1E4)),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF6EC1E4)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF6EC1E4)),
      ),
      focusColor: Color(0xFF6EC1E4),
      hintStyle: TextStyle(color: Color(0xFFF2F2F2)),
      prefixIconColor: Color(0xFF6EC1E4),
      iconColor: Color(0xFFF2F2F2),
      suffixIconColor: Color(0xFFF2F2F2),
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF6EC1E4)),
      elevation: WidgetStateProperty.all<double>(0),
      side: WidgetStateProperty.all<BorderSide>(
        const BorderSide(color: Color(0xFF6EC1E4)),
      ),
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xFF6EC1E4)),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF6EC1E4)),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF6EC1E4)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF6EC1E4)),
    ),
    focusColor: Color(0xFF6EC1E4),
    hintStyle: TextStyle(color: Color(0xFFF2F2F2)),
    prefixIconColor: Color(0xFF6EC1E4),
    iconColor: Color(0xFFF2F2F2),
    suffixIconColor: Color(0xFFF2F2F2),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF7A7A7A),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF6EC1E4),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF6EC1E4),
    selectedItemColor: Color(0xFF54595F),
    unselectedItemColor: Color(0xFF7A7A7A),
  ),
  cardTheme: const CardTheme(
    color: Color(0xFF6EC1E4),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF6EC1E4),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF6EC1E4),
    contentTextStyle: TextStyle(color: Color(0xFF54595F)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(const Color(0xFF6EC1E4)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF6EC1E4)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(const Color(0xFF6EC1E4)),
    ),
  ),
);
