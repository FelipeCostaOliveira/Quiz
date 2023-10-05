import 'package:flutter/material.dart';
import 'package:quiz/pages/home.dart';
import 'package:quiz/pages/quiz.dart';
import 'package:quiz/pages/resultados.dart';
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

