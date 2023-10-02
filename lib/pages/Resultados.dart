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
    final argumentos =
        ModalRoute.of(context)?.settings.arguments as Argumentos?;

    if (argumentos != null) {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Resultado',
                style: TextStyle(
                  fontSize: 50,               
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  
              ),
                
              ),
              Text(
                'Você acertou\n${argumentos.acertos} de 10\nperguntas',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white60
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                height: 60, // Aumentei a altura do botão
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
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(33, 0, 110, 255),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      Navigator.pop(context); // Isso volta para a tela anterior
      return Container();
    }
  }
}
