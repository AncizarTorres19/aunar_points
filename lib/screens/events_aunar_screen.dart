import 'package:aunar_points/class/envent.dart';
import 'package:aunar_points/services/events_service.dart';
import 'package:flutter/material.dart';

class EventsAunarScreen extends StatelessWidget {
  const EventsAunarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos Aunar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Evento>>(
          future: getEvents(),
          builder: (context, AsyncSnapshot<List<Evento>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('Error al cargar los eventos');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var evento in snapshot.data!)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: EventoCard(evento: evento),
                  ),
              ],
            );
          },
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
