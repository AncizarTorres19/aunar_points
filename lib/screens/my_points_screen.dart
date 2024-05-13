import 'package:aunar_points/class/transaction.dart';
import 'package:flutter/material.dart';
// Services
import 'package:aunar_points/services/points_transactions_service.dart';

class MyPointsScreen extends StatefulWidget {
  const MyPointsScreen({Key? key}) : super(key: key);

  @override
  _MyPointsScreenState createState() => _MyPointsScreenState();
}

class _MyPointsScreenState extends State<MyPointsScreen> {
  List<CustomTransaction> pointsTransactions = [];
  bool _isLoading = true;
  int totalPoints = 0; // Variable para almacenar la suma de puntos

  @override
  void initState() {
    super.initState();
    _loadPointsTransactions();
  }

  Future<void> _loadPointsTransactions() async {
    try {
      List<CustomTransaction> transactions = await getPointsTransactions();
      setState(() {
        pointsTransactions = transactions;
        _isLoading = false;
        // Calculamos la suma de puntos
        totalPoints = pointsTransactions.fold(
            0, (prev, element) => prev + element.puntos);
      });
    } catch (e) {
      print("Error al obtener las transacciones de puntos: $e");
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
            Text(
              'Total de Puntos: $totalPoints',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            const Text(
              'Transacciones Recientes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      for (var transaccion in pointsTransactions)
                        Card(
                          child: ListTile(
                            title:
                                Text('Descripción: ${transaccion.descripcion}'),
                            subtitle: Text('Fecha: ${transaccion.fecha}'),
                            trailing: Text('+${transaccion.puntos} puntos'),
                          ),
                        ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
