import 'package:aunar_points/class/envent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Evento>> getEvents() async {
  try {
    // Obtenemos una referencia a la colección "events" en Firestore
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('events').get();

    // Convertimos los documentos en una lista de objetos Evento
    List<Evento> eventos = querySnapshot.docs.map((doc) {
      return Evento.fromFirestore(
          doc); // Utiliza el método fromFirestore para crear instancias de Evento
    }).toList();

    return eventos;
  } catch (e) {
    print("Error al obtener los eventos: $e");
    throw Exception('Error al obtener los eventos');
  }
}
