import 'package:flutter/material.dart';
import 'package:hello_world/home_screen.dart';
import 'package:hello_world/segunda_tela.dart';
import 'package:hello_world/sensores.dart';
import 'package:hello_world/tip_calculator.dart';
import 'package:hello_world/desenho.dart';


// Importe o seu DatabaseHelper

// Importações específicas para desktop e web
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart'; // Para kIsWeb
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialização específica para diferentes plataformas
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
    // O Sqflite por padrão vai usar o FFI para web se disponível
  } else if (defaultTargetPlatform == TargetPlatform.windows ||
             defaultTargetPlatform == TargetPlatform.linux ||
             defaultTargetPlatform == TargetPlatform.macOS) {
    // Para desktop, usamos sqflite_common_ffi
    sqfliteFfiInit(); // Inicializa o FFI para desktop
    databaseFactory = databaseFactoryFfi; // Define a factory para desktop
  }

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
      soma = int.parse(_controller1.text) + int.parse(_controller2.text);    
    });
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
          spacing: 20,
          children: <Widget>[
            SizedBox(height: 15),
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
            const SizedBox(height: 5),
            Text(
              'A soma é: $soma',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
            ElevatedButton(
              onPressed: () {
                // Navega para a SecondScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TipCalculator()),
                );
              },
              child: const Text('Ir para a Calculadora de Gorjeta'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a SecondScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DatabaseHomeScreen()),
                );
              },
              child: const Text('Ir para Banco de Dados'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a SecondScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SensorsScreen()),
                );
              },
              child: const Text('Ir para Teste de Sensores'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a SecondScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DrawingScreen()),
                );
              },
              child: const Text('Ir para Teste de Desenho'),
            ),
          ],
        ),
      ),
    
    );
  }
}
