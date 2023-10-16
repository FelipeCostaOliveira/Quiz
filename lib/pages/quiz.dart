import 'package:flutter/material.dart';
import 'package:quiz/pages/resultados.dart';
import 'package:quiz/pages/dados.dart';
//import 'dart:math';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 0; 
  int acertos = 0;
  int erros = 0;
  bool quizConcluido = false;
  List feito = [];
  int repostaCorreta = -1;

  void repetida() {
    setState(() {
      quiz.shuffle();
      var pergunta = quiz[perguntaNumero]['pergunta'];
      if (feito.contains(pergunta)) {
        while (feito.contains(pergunta)) {
          quiz.shuffle();
          pergunta = quiz[perguntaNumero]['pergunta'];
        }
      }
      feito.add(pergunta);
    });
  }

  void questao(respostaNumero) {
    if (quiz[perguntaNumero]['alternativa_certa'] == respostaNumero) {
      acertos++;
    } else {
      erros++;
    }
  }

  void respondeu(int respostaNumero) {
    if (!quizConcluido) {
      setState(() {
        if (perguntaNumero < quiz.length - 1) {
          questao(respostaNumero);
          perguntaNumero++;
          repetida();
        } else {
          questao(respostaNumero);
          quizConcluido = true;
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    quiz.forEach((elemento) {
      int alternativaCorreta = elemento['alternativa_certa'];
      List respostas = elemento['respostas'];

      String respostaCerta = elemento['respostas'][alternativaCorreta];

      respostas.shuffle();
      int i = 0;
      respostas.forEach((elemento) {
        if (elemento == respostaCerta) {
          alternativaCorreta = i;
        }
        i++;
      });
      elemento['alternativa_certa'] = alternativaCorreta;
    });
    var pergunta = quiz[perguntaNumero]['pergunta'];
    var resposta = quiz[perguntaNumero]['respostas'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(184, 0, 89, 255),
        centerTitle: true,
        title: const Text(
          'Quiz',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 27, 61, 255),
              Color.fromARGB(255, 88, 88, 255),
              Color.fromARGB(143, 97, 150, 255),
            ],
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Pergunta ${perguntaNumero + 1} de ${quiz.length}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(155, 255, 255, 255),
                ),
              ),
            ),
            Text(
              pergunta,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            for (var i = 0; i < resposta.length; i++)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: quizConcluido
                      ? null
                      : () {
                          respondeu(i);
                        },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.pressed) &&
                            quiz[perguntaNumero]['alternativa_certa'] == i) {
                          return const Color.fromARGB(255, 16, 189, 0);
                        } else if (states.contains(MaterialState.pressed) &&
                            quiz[perguntaNumero]['alternativa_certa'] != i) {
                          return const Color.fromARGB(255, 221, 18, 3);
                        } else {
                          return Color.fromARGB(69, 75, 156, 248);
                        }
                      },
                    ),
                  ),
                  child: Text(
                    quiz[perguntaNumero]['respostas'][i],
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
