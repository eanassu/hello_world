import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}
class _TipCalculatorState extends State<TipCalculator> {
  double currentSliderValue = 20.0;
  double currentDiscreteSliderValue = 60;
   bool year2023 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Gorjeta'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Este é a calculadora de gorjeta!',
              style: TextStyle(fontSize: 20),
          ),
              Slider(
              year2023: year2023,
              value: currentSliderValue,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  currentSliderValue = value;
                });
              },
            ),
            Slider(
              year2023: year2023,
              value: currentDiscreteSliderValue,
              max: 100,
              divisions: 5,
              label: currentDiscreteSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  currentDiscreteSliderValue = value;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Volta para a tela anterior
                Navigator.pop(context);
              },
              child: const Text('Voltar para a Tela Principal'),
            ),
          ],
        ),
      ),
    );
  }
}