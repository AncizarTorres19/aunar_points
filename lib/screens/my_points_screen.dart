import 'package:flutter/material.dart';

class MyPointsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pointsTransactions = [
    {'Fecha': '01/03/2024', 'Descripción': 'Compra de libros', 'Puntos': 20},
    {
      'Fecha': '05/03/2024',
      'Descripción': 'Asistencia al evento',
      'Puntos': 10
    },
    {
      'Fecha': '10/03/2024',
      'Descripción': 'Participación en encuesta',
      'Puntos': 5
    },
  ];

  MyPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus Puntos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Total de Puntos: 35',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            const Text(
              'Transacciones Recientes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (var transaccion in pointsTransactions)
              Card(
                child: ListTile(
                  title: Text(transaccion['Descripción']),
                  subtitle: Text('Fecha: ${transaccion['Fecha']}'),
                  trailing: Text('+${transaccion['Puntos']} puntos'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
