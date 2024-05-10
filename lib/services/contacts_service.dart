import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getContacts() async {
  // Obtener una referencia a la colección "contacts" en Firestore
  CollectionReference contactsRef =
      FirebaseFirestore.instance.collection('contacts');

  try {
    // Obtener los documentos de la colección
    QuerySnapshot querySnapshot = await contactsRef.get();

    // Convertir los documentos en una lista de mapas
    List<Map<String, dynamic>> contactsList = [];
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> contact = {
        'id': doc.id,
        'name': doc['name'],
        'phone_number': doc['phone_number'],
      };
      contactsList.add(contact);
    });

    return contactsList;
  } catch (e) {
    print("Error al obtener los contactos: $e");
    throw Exception('Error al obtener los contactos');
  }
}
