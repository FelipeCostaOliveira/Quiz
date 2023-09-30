import 'package:flutter/material.dart';
// import 'QuizPage.dart';
 
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/logo.png'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Quiz');
                  },
                  child: Text(
                    'Jogar',
                    style: TextStyle(fontSize: 50),
                  )),
            ],
          ),
        ));
  }
}
