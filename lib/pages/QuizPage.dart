import 'package:flutter/material.dart';
import 'package:quiz/pages/Resultados.dart';
import 'package:quiz/pages/dados.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 0; // Iniciar com 0 para acessar a primeira pergunta corretamente
  int acertos = 0;
  int erros = 0;
  bool quizConcluido = false;

  @override
  Widget build(BuildContext context) {
    void respondeu(int respostaNumero) {
      if (!quizConcluido) {
        setState(() {
          if (perguntaNumero < quiz.length) {
            if (quiz[perguntaNumero]['alternativa_certa'] == respostaNumero) {
              print('acertou');
              acertos++;
            } else {
              print('errou');
              erros++;
            }

            print('acertos totais: $acertos\nerros totais: $erros');

            if (perguntaNumero == quiz.length - 1) {
              print('terminou o quiz');
              quizConcluido = true;
              Navigator.pushNamed(context, 'Resultado',
                  arguments: Argumentos(acertos));
            } else {
              perguntaNumero++;
            }
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(216, 0, 31, 207),
        centerTitle: true,
        title: const Text(
          'Quiz',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 7, 9, 146),
              Color.fromARGB(255, 68, 112, 243),
              Color.fromARGB(143, 156, 147, 238),
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
              'Pergunta:\n\n ' + quiz[perguntaNumero]['pergunta'],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            for (var i = 0; i < quiz[perguntaNumero]['respostas'].length; i++)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: quizConcluido
                      ? null
                      : () {
                          respondeu(i);
                        },
                  child: Text(
                    quiz[perguntaNumero]['respostas'][i],
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(50, 0, 162, 255)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
