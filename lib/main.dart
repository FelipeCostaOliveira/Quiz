import 'package:flutter/material.dart';
import 'package:quiz/pages/HomePage.dart';
import 'package:quiz/pages/QuizPage.dart';
import 'package:quiz/pages/Resultados.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/Quiz':(context) => Quiz(),
        Resultados.routename:(context) => Resultados(),      
      },
    );
  }
}

