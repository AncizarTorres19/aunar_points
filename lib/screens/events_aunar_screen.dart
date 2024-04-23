import 'package:flutter/material.dart';

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
}

class EventsAunarScreen extends StatelessWidget {
  final List<Evento> eventos = [
    Evento(
      nombre: 'Evento 1',
      lugar: 'Lugar 1',
      fecha: '01/01/2023',
      hora: '10:00 AM',
      puntos: 5,
    ),
    Evento(
      nombre: 'Evento 2',
      lugar: 'Lugar 2',
      fecha: '02/02/2023',
      hora: '11:00 AM',
      puntos: 10,
    ),
    Evento(
      nombre: 'Evento 3',
      lugar: 'Lugar 3',
      fecha: '02/02/2023',
      hora: '11:00 AM',
      puntos: 40,
    ),
    Evento(
      nombre: 'Evento 4',
      lugar: 'Lugar 4',
      fecha: '02/02/2023',
      hora: '11:00 AM',
      puntos: 2,
    ),
  ];

  EventsAunarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos Aunar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: eventos.map((evento) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: EventoCard(evento: evento),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Widget para mostrar un evento como una card
class EventoCard extends StatelessWidget {
  final Evento evento;

  const EventoCard({Key? key, required this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              evento.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Lugar: ${evento.lugar}'),
            Text('Fecha: ${evento.fecha}'),
            Text('Hora: ${evento.hora}'),
            Text('Puntos: ${evento.puntos}'),
          ],
        ),
      ),
    );
  }
}
