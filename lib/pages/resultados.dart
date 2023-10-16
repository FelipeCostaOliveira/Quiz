import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quiz/pages/quiz.dart';

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
      const totalPerguntas = 10;
      final acertos = argumentos.acertos;
      final erros = 10 - acertos;
      final acertosPorcentagem =
          (acertos / totalPerguntas * 100).toInt();
     final errosPorcentagem = (erros / totalPerguntas * 100).toInt();

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
              Navigator.pop(context); // Retorna à página anterior
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
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Text(
                    'Acertos: $acertos' ,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(179, 60, 255, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Erros: $erros' ,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(246, 255, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 0),
                height: 200, 
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: const Color.fromARGB(255, 60, 255, 0),
                        value: acertos.toDouble(),
                        title: '$acertosPorcentagem%',
                        radius: 20,
                        titleStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PieChartSectionData(
                        color: const Color.fromARGB(246, 255, 0, 0), 
                        value: erros.toDouble(),
                        title: '$errosPorcentagem%',
                        radius: 20,
                        titleStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    sectionsSpace: 0, //espaço entre as seções
                    centerSpaceRadius: 100, //espaço no centro
                    startDegreeOffset: 90, //define em qual grau passa a linha
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Quiz()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(69, 75, 156, 248),
                    ),
                  ),
                  child: const Text(
                    'Jogar Novamente',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  
                ),
              )
            ],
          ),
        ),
      );
    } else {
      Navigator.pop(context);
      return Container();
    }
  }
}
