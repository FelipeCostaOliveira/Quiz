import 'package:flutter/material.dart';
import 'QuizPage.dart';

class Resultados extends StatelessWidget {
  const Resultados({Key? key, required this.acertos }) : super(key: key);
  final int acertos;
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Resultado',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                'Você acertou\n$acertos de 10\nperguntas',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quiz()),
                    );
                  },
                  child: Text(
                    'Jogar Novamente',
                    style: TextStyle(fontSize: 40),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
