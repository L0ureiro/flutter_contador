import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _contadorCasa = 0;
  final int _contadorTrabalho = 0;
  final int _contadorEstudo = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contador de Tarefas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Tarefa(imagePath: 'images/bg-house.jpg', nicho: 'Casa', contador: _contadorCasa),
              Tarefa(imagePath: 'images/bg-work.jpg', nicho: 'Trabalho',contador:  _contadorTrabalho),
              Tarefa(imagePath: 'images/bg-study.jpg', nicho: 'Estudo',contador:  _contadorEstudo),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}

class Tarefa extends StatelessWidget {
  final String imagePath;
  final String nicho;
  final int contador;

  Tarefa({super.key,  
    required this.imagePath,
    required this.nicho,
    required this.contador,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tarefas de $nicho', style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)),
                      Text('Total: $contador', style: const TextStyle(fontSize: 22, color: Colors.black)),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Icon(Icons.remove, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

