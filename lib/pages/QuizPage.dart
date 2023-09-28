import 'package:flutter/material.dart';
import 'Resultados.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    List quiz = [
      {
        "pergunta": "a?",
        "respostas": [
          "1",
          "2",
          "3",
          "4",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "b",
        "repostas": [
          "5",
          "6",
          "7",
          "8",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "c",
        "repostas": [
          "9",
          "10",
          "11",
          "12",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "d",
        "repostas": [
          "13",
          "14",
          "15",
          "16",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "e",
        "repostas": [
          "17",
          "18",
          "19",
          "20",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "f",
        "repostas": [
          "21",
          "22",
          "23",
          "24",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "g",
        "repostas": [
          "25",
          "26",
          "27",
          "28",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "h",
        "repostas": [
          "29",
          "30",
          "31",
          "32",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "i",
        "repostas": [
          "33",
          "34",
          "35",
          "36",
        ],
        "alternativa_certa": 2,
      },
      {
        "pergunta": "j",
        "repostas": [
          "37",
          "38",
          "39",
          "40",
        ],
        "alternativa_certa": 2,
      },
    ];
    print('dados');
    //print(quiz);
    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_certa'] == respostaNumero) {
          print('acertou');
          acertos++;
        } else {
          print('errou');
          erros++;
        }

        print('acertos totais: $acertos\nerros totais: $erros');
        if (perguntaNumero == 10) {
          print('terminou o quiz');
        } else {
          perguntaNumero++;
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
                child: Text('Pergunta $perguntaNumero de 10'),
              ),
              Text('Pergunta:\n\n ' + quiz[perguntaNumero - 1]['pergunta']),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Resultados');
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/Resultados');
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/Resultados');
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/Resultados');
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][3],
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
