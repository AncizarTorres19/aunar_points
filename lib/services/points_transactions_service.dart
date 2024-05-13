import 'package:aunar_points/class/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<CustomTransaction>> getPointsTransactions() async {
  try {
    // Obtenemos una referencia a la colección "points_transactions" en Firestore
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('points_transactions').get();

    // Convertimos los documentos en una lista de objetos CustomTransaction
    List<CustomTransaction> eventos = querySnapshot.docs.map((doc) {
      return CustomTransaction.fromFirestore(
          doc); // Utiliza el método fromFirestore para crear instancias de CustomTransaction
    }).toList();

    return eventos;
  } catch (e) {
    print("Error al obtener los eventos: $e");
    throw Exception('Error al obtener los eventos');
  }
}
