import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quiz/pages/QuizPage.dart';

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
      final totalPerguntas = 10;
      final acertos = argumentos.acertos;
      final erros = totalPerguntas - acertos;
      final acertosPorcentagem =
          (acertos / totalPerguntas * 100).toInt();
      final errosPorcentagem = (erros / totalPerguntas * 100).toInt();

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
              SizedBox(height: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center, // Alinhe os widgets verticalmente ao centro
                crossAxisAlignment: CrossAxisAlignment.center, // Alinhe os widgets horizontalmente ao centro
                children: [
                  Text(
                    'Acertos: $acertos' ,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 60, 255, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Erros: $acertos' ,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(204, 255, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(width: 1),
              // Gráfico de pizza aqui
              Container(
                margin: EdgeInsets.only(top: 0),
                width: 300, // Set the desired width
                height: 300, // Set the desired height
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Color.fromARGB(255, 60, 255, 0),// Cor para acertos
                        value: acertos.toDouble(),
                        title: '$acertosPorcentagem%',
                        radius: 80,
                        titleStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PieChartSectionData(
                        color: Color.fromARGB(204, 255, 0, 0), // Cor para erros
                        value: erros.toDouble(), // Total de perguntas - acertos
                        title: '$errosPorcentagem%',
                        radius: 80,
                        titleStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    sectionsSpace: 0, //espaço entre as seções
                    centerSpaceRadius: 0, //espaço no centro
                    startDegreeOffset: 90, //define em qual grau passa a linha
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
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
