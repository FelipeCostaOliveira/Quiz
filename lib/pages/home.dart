import 'package:flutter/material.dart';
 
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
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
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/logo5.png"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Quiz');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(19, 0, 153, 255)), // Cor de fundo desejada
                     ),
                    child: const Text(
                      'Jogar',
                      style: TextStyle(fontSize: 50, color: Colors.white), 
                    ),
                ),
              ],
            ),),
        ));
  }
}
