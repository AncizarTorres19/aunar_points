import 'package:cloud_firestore/cloud_firestore.dart';

class Evento {
  final String nombre;
  final String lugar;
  final String fecha;
  final String hora;
  final int puntos;

  Evento({
    required this.nombre,
    required this.lugar,
    required this.fecha,
    required this.hora,
    required this.puntos,
  });

  // Método estático para crear un Evento a partir de un documento de Firestore
  static Evento fromFirestore(DocumentSnapshot doc) {
    // Convierte el Timestamp de Firestore a un objeto DateTime
    DateTime fechaEvento = (doc['date'] as Timestamp).toDate();

    // Formatea la fecha como una cadena en el formato deseado (por ejemplo, "dd/MM/yyyy")
    String fechaFormateada =
        "${fechaEvento.day}/${fechaEvento.month}/${fechaEvento.year}";

    String horaFormateada = "${fechaEvento.hour}:${fechaEvento.minute}";

    // Crea y devuelve un objeto Evento con la fecha formateada
    return Evento(
      nombre: doc['name'],
      lugar: doc['place'],
      fecha: fechaFormateada,
      hora: horaFormateada,
      puntos: doc['points'],
    );
  }
}
