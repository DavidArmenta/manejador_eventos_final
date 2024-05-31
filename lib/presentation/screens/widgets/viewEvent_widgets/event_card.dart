import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/models/event_model.dart';
import 'package:manejador_eventos/presentation/providers/auth_provider.dart';
import 'package:manejador_eventos/presentation/providers/event_provider.dart';

class EventoCard extends ConsumerStatefulWidget {
  final Event evento;
  const EventoCard({super.key, required this.evento});

  @override
  _EventoCardState createState() => _EventoCardState();
}

class _EventoCardState extends ConsumerState<EventoCard> {
  @override
  Widget build(BuildContext context) {

    return Card(
      color: const Color.fromARGB(255, 255, 220, 220),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9, // Proporción de la imagen
            child: Image.network(
              'https://steamuserimages-a.akamaihd.net/ugc/775113739117651791/2B682EEFB34BB94226EBAF806439D2955D30BE9C/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false', // URL de la imagen de ejemplo
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.evento.nameEvent,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Tipo: ${widget.evento.typeEvent}'),
                const SizedBox(height: 4),
                Text('Descripción: ${widget.evento.description}'),
                const SizedBox(height: 4),
                Text('Ubicación: ${widget.evento.location}'),
                const SizedBox(height: 4),
                Text('Fecha: ${widget.evento.date}'),
                const SizedBox(height: 4),
                Text('Hora de inicio: ${widget.evento.hourStar}'),
                const SizedBox(height: 4),
                Text('Hora de fin: ${widget.evento.hourEnd}'),
                const SizedBox(height: 4),
                Text('Capacidad: ${widget.evento.capacity}  personas.'),
                const SizedBox(height: 4),
                Text('Vacantes: ${widget.evento.availability}  personas.'),
                const SizedBox(height: 16),
                Text('Owner: ${widget.evento.owner}'),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    if (ref.read(authProvider.notifier).currentUser?.username == widget.evento.owner) {
                      context.go('/edit-event', extra: widget.evento);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Solo el propietario del evento puede editar')),
                      );
                    }
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar evento'),
                ),
                  ElevatedButton.icon(
                  onPressed: () async {
                    final availability = await ref.read(eventProvider.notifier).joinEvent(widget.evento);

                    if (availability) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Se unió al evento exitosamente :)')),
                      );
                      context.go('/menu-page');
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No se puede unir a ese Evento :(')),
                      );
                    }

                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Unirse al evento'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}