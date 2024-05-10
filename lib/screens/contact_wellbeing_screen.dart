import 'package:aunar_points/services/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactWellbeingScreen extends StatelessWidget {
  const ContactWellbeingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos de Bienestar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: getContacts(),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('Error al cargar los contactos');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var contacto in snapshot.data!)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contacto['name'] ?? '', // Accede al campo 'name'
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        contacto['phone_number'] ??
                            '', // Accede al campo 'phone_number'
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
