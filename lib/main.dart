import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _totalTarefas = 0;
  String _mensagem = 'Ainda lidável';

  void ajustarValor(int valor) {
    setState(() {
      _totalTarefas += valor;
    });
    _totalTarefas > 15 ? _mensagem = 'Ei se oriente por favor' : _mensagem = 'Ainda lidável';
  }

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total de tarefas: $_totalTarefas \n $_mensagem',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Tarefa(imagePath: 'images/bg-house.jpg', nicho: 'Casa', valorAlterado: ajustarValor),
              Tarefa(imagePath: 'images/bg-work.jpg', nicho: 'Trabalho', valorAlterado: ajustarValor),
              Tarefa(imagePath: 'images/bg-study.jpg', nicho: 'Estudo', valorAlterado: ajustarValor),
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

class Tarefa extends StatefulWidget {
  final String imagePath;
  final String nicho;
  final Function valorAlterado;

  const Tarefa(
      {super.key,
      required this.imagePath,
      required this.nicho,
      required this.valorAlterado});

  @override
  State<Tarefa> createState() => _Tarefa();
}

class _Tarefa extends State<Tarefa> {
  int _contador = 0;

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
              widget.imagePath,
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
                      Text('Tarefas de ${widget.nicho}',
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text('Total: $_contador',
                          style: const TextStyle(
                              fontSize: 22, color: Colors.black)),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _contador++;
                        });
                        widget.valorAlterado(1);
                      },
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_contador > 0) {
                          setState(() {
                            _contador--;
                          });
                          widget.valorAlterado(-1);
                        }
                      },
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
