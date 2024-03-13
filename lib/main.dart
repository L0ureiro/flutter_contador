import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
              Stack(children: [
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'images/bg-house.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Add your Text and Buttons here as shown above
              ]),
              Stack(children: [
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'images/bg-study.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Add your Text and Buttons here as shown above
              ]),
              Stack(children: [
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'images/bg-work.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Add your Text and Buttons here as shown above
              ]),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
