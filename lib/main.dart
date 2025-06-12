import 'package:flutter/material.dart';
import 'portfolio_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ribamar Alves | Flutter Dev',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}
