import 'package:flutter/material.dart';

// Método para calcular el total de puntos
// int calcularTotalPuntos(List<Map<String, dynamic>> transacciones) {
//   return transacciones.fold<int>(
//     0,
//     (total, transaccion) => total + int.parse(transaccion['Puntos'] ?? 0),
//   );
// }

class MyPointsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transacciones = [
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
    // int totalPuntos =
    //     calcularTotalPuntos(transacciones);

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
            for (var transaccion in transacciones)
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
