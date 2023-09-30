import 'package:flutter/material.dart';
import 'package:quiz/pages/Resultados.dart';
import 'package:quiz/pages/dados.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;
  bool quizConcluido = false; // Variável para controlar se o quiz foi concluído

  @override
  Widget build(BuildContext context) {
    // quiz.shuffle();
    quiz.forEach((elemento) {
      int alternativa_correta = elemento['alternativa_certa'];
      List respostas = elemento['respostas'];
      String reposta_certa = elemento['respostas'][alternativa_correta - 1];

      respostas.shuffle();
      int i = 1;

      respostas.forEach((elemento) {
        // print(elemento);
        if (elemento == reposta_certa) {
          alternativa_correta = i;
        }
        i++;
      });
      elemento['alternativa_certa'] = alternativa_correta;
    });

    void respondeu(int respostaNumero) {
      setState(() {
        if (!quizConcluido) {
          // Verifica se o quiz ainda não foi concluído
          if (perguntaNumero <= quiz.length) {
            if (quiz[perguntaNumero - 1]['alternativa_certa'] ==
                respostaNumero) {
              print('acertou');
              acertos++;
            } else {
              print('errou');
              erros++;
            }

            print('acertos totais: $acertos\nerros totais: $erros');

            if (perguntaNumero == quiz.length) {
              print('terminou o quiz');
              quizConcluido = true;
              Navigator.pushNamed(context, 'Resultado',
                  arguments: Argumentos(acertos));
            } else {
              perguntaNumero++;
            }
          }
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Quiz',
          style: TextStyle(fontSize: 40),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Pergunta $perguntaNumero de ${quiz.length}'),
            ),
            Text('Pergunta:\n\n ' + quiz[perguntaNumero - 1]['pergunta']),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: quizConcluido
                    ? null
                    : () {
                        respondeu(1);
                      },
                child: Text(
                  quiz[perguntaNumero - 1]['respostas'][0],
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: quizConcluido
                    ? null
                    : () {
                        respondeu(2);
                      },
                child: Text(
                  quiz[perguntaNumero - 1]['respostas'][1],
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: quizConcluido
                    ? null
                    : () {
                        respondeu(3);
                      },
                child: Text(
                  quiz[perguntaNumero - 1]['respostas'][2],
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: quizConcluido
                    ? null
                    : () {
                        respondeu(4);
                      },
                child: Text(
                  quiz[perguntaNumero - 1]['respostas'][3],
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Quiz(),
    ),
  );
}
