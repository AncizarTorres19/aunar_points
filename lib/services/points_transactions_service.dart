import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getPointsTransactions() async {
  try {
    // Obtén una referencia a la colección "points_transactions" en Firestore
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('points_transactions').get();

    // Convierte los documentos en una lista de Map<String, dynamic>
    List<Map<String, dynamic>> transactions = querySnapshot.docs.map((doc) {
      return {
        'Fecha': doc['date'], // Asegúrate de que los campos en Firestore coincidan con los nombres aquí
        'Descripción': doc['description'],
        'Puntos': doc['points'],
      };
    }).toList();

    return transactions;
  } catch (e) {
    print("Error al obtener las transacciones de puntos: $e");
    throw Exception('Error al obtener las transacciones de puntos');
  }
}
