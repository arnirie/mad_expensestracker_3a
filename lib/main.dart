import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3a/screens/expenses_list.dart';

void main() {
  runApp(ExpensesTrackerApp());
}

class ExpensesTrackerApp extends StatelessWidget {
  const ExpensesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Color(0xFF001B79),
    );
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        // scaffoldBackgroundColor: Colors.red,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.onPrimary,
          elevation: 4,
        ),
        cardTheme: CardTheme(
          color: colorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w300,
          ),
          displayLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.onPrimaryContainer,
            foregroundColor: colorScheme.onPrimary,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ExpensesListScreen(),
    );
  }
}
