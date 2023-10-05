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
        backgroundColor: const Color.fromARGB(186, 0, 0, 0),
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
              Color.fromARGB(255, 22, 23, 29),
              Color.fromARGB(255, 44, 44, 53),
              Color.fromARGB(143, 58, 57, 63),
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
                  color: Colors.white30,
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
                          return const Color.fromARGB(69, 101, 101, 102);
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
