import 'package:flutter/material.dart';
// import 'QuizPage.dart';
 
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/logo.png'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Quiz');
                    },
                    child: const Text(
                      'Jogar',
                      style: TextStyle(fontSize: 50, color: Colors.white), 
                    ),
                     style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(19, 0, 153, 255)), // Cor de fundo desejada
                      ),
                    
                ),
              ],
            ),),
        ));
  }
}
