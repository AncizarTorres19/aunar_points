import 'package:aunar_points/services/points_transactions_service.dart';
import 'package:flutter/material.dart';

class MyPointsScreen extends StatefulWidget {
  const MyPointsScreen({Key? key}) : super(key: key);

  @override
  _MyPointsScreenState createState() => _MyPointsScreenState();
}

class _MyPointsScreenState extends State<MyPointsScreen> {
  List<Map<String, dynamic>> pointsTransactions = [];

  @override
  void initState() {
    super.initState();
    // Llama a la función getPointsTransactions() al iniciar la pantalla
    _loadPointsTransactions();
  }

  Future<void> _loadPointsTransactions() async {
    try {
      // Obtén las transacciones de puntos desde Firestore
      List<Map<String, dynamic>> transactions = await getPointsTransactions();
      setState(() {
        // Actualiza el estado de las transacciones de puntos
        pointsTransactions = transactions;
      });
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir al cargar las transacciones de puntos
      print("Error al obtener las transacciones de puntos: $e");
      // Puedes mostrar un mensaje de error al usuario si lo deseas
    }
  }

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
