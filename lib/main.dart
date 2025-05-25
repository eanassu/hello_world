import 'package:flutter/material.dart';
import 'package:hello_world/segunda_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeiro Programa Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Primeiro Programa Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  int soma = 0;

  void calcularSoma() {
    setState(() {
      soma = int.parse(_controller1.text) + int.parse(_controller2.text);    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller1, 
              decoration: InputDecoration(
                labelText: 'Digite um número',
                hintText: 'Um número',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'Digite outro número',
                hintText: 'Outro número',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: calcularSoma,
              child: Text('Somar')
            ),
            const SizedBox(height: 30),
            Text(
              'A soma é: $soma',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navega para a SecondScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Ir para a Segunda Tela'),
            ),
          ],
        ),
      ),
    );
  }
}
