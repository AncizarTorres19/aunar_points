import 'package:flutter/material.dart';

class ContactWellbeingScreen extends StatelessWidget {
  final List<Map<String, String>> contactos = [
    {'Nombre': 'Contacto de Bienestar', 'Número': '123456789'},
    {'Nombre': 'Contacto de Psicología', 'Número': '987654321'},
    {'Nombre': 'Contacto de Área Musical', 'Número': '123456789'},
  ];

  ContactWellbeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos de Bienestar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var contacto in contactos)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contacto['Nombre']!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    contacto['Número']!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
