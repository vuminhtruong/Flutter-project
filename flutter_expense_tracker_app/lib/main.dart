import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker_app/widget/expenses.dart';

var appColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(165, 148, 82, 169));

var appDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 55, 55, 63));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: appDarkColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: appDarkColorScheme.primaryContainer,
              foregroundColor: appDarkColorScheme.onPrimaryContainer,
            )),
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: appColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: appColorScheme.onPrimaryContainer,
            foregroundColor: appColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: appColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: appColorScheme.onInverseSurface,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: appColorScheme.onSecondaryContainer,
                fontSize: 20,
              ))),
      home: const Expenses(),
    ),
  );
}
