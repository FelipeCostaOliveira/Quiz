import 'package:flutter/material.dart';
import 'QuizPage.dart';

class Argumentos {
  int acertos = 0;
  Argumentos(this.acertos);
}

class Resultados extends StatelessWidget {
  static const routename = 'Resultado';
  const Resultados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)?.settings.arguments as Argumentos;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
          padding: const EdgeInsets.all(.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Resultado',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                'Você acertou\n${argumentos.acertos} de 10\nperguntas',
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
                    style: TextStyle(fontSize: 40, color: Colors.white), 
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)), // Cor de fundo desejada
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
