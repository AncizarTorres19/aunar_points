import 'package:cloud_firestore/cloud_firestore.dart';

class CustomTransaction {
  final String fecha;
  final String hora;
  final String descripcion;
  final int puntos;

  CustomTransaction({
    required this.fecha,
    required this.hora,
    required this.descripcion,
    required this.puntos,
  });

  // Método estático para crear un CustomTransaction a partir de un documento de Firestore
  static CustomTransaction fromFirestore(DocumentSnapshot doc) {
    // Convierte el Timestamp de Firestore a un objeto DateTime
    DateTime fechaTransaction = (doc['date'] as Timestamp).toDate();

    // Formatea la fecha como una cadena en el formato deseado (por ejemplo, "dd/MM/yyyy")
    String fechaFormateada =
        "${fechaTransaction.day}/${fechaTransaction.month}/${fechaTransaction.year}";

    String horaFormateada =
        "${fechaTransaction.hour}:${fechaTransaction.minute}";

    // Crea y devuelve un objeto CustomTransaction con la fecha formateada
    return CustomTransaction(
      fecha: fechaFormateada,
      hora: horaFormateada,
      descripcion: doc['description'],
      puntos: doc['points'],
    );
  }
}
