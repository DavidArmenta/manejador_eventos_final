import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/presentation/providers/event_provider.dart';
import 'package:manejador_eventos/models/event_model.dart';
import 'package:manejador_eventos/presentation/screens/widgets/event_creation_custom_fields/inputs_creation_event_barrido.dart';

class EditEventScreen extends ConsumerStatefulWidget {
  final Event event;
  const EditEventScreen({super.key , required this.event});


  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends ConsumerState<EditEventScreen> {
  late Event _event;


  late String eventName = '';
  late String eventType = '';
  late String eventDescription = '';
  late String eventLocation = '';
  late String eventDate = '';
  late String eventHourStar = '';
  late String eventHourEnd = '';
  late String eventCapacity = '';

  @override
  void initState() {
    super.initState();
    _event = widget.event;
  }
  final _formKey = GlobalKey<FormState>();
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Evento'), 
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                name_Input(
                  initialValue: _event.nameEvent,
                  onChanged: (value) => eventName = value,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Type_Event(
                  initialValue: _event.typeEvent,
                  onChanged: (value) => eventType = value,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Description_Input(
                  initialValue: _event.description,
                  onChanged: (value) => eventDescription = value,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                address_input(
                  initialValue: _event.location,
                  onChanged: (value) => eventLocation = value,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Date_Input(
                  initialValue: _event.date,
                  onChanged: (value) => eventDate = value,
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                HourStart_input(
                  initialValue: TimeOfDay(hour: int.parse(_event.hourStar), minute: 0),
                  onChanged: (value) => eventHourStar = value.hour.toString(),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                HourEnd_input(
                  initialValue: TimeOfDay(hour: int.parse(_event.hourEnd), minute: 0),
                  onChanged: (value) => eventHourEnd = value.hour.toString(),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                Capacity_input(
                  initialValue: int.parse(_event.capacity).toString(),
                  onChanged: (value) => eventCapacity = value.toString(),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate()?? false) {
                      final updatedEvent = Event(
                      id: _event.id,
                      nameEvent: eventName.isEmpty? _event.nameEvent : eventName,
                      typeEvent: eventType.isEmpty? _event.typeEvent : eventType,
                      description: eventDescription.isEmpty? _event.description : eventDescription,
                      location: eventLocation.isEmpty? _event.location : eventLocation,
                      date: eventDate.isEmpty? _event.date : eventDate,
                      hourStar: eventHourStar.isEmpty? _event.hourStar : eventHourStar,
                      hourEnd: eventHourEnd.isEmpty? _event.hourEnd : eventHourEnd,
                      capacity: eventCapacity.isEmpty? _event.capacity : eventCapacity,
                      owner: _event.owner,
                      availability: _event.availability,
                      );
                      ref.read(eventProvider.notifier).updateEvent(updatedEvent);
                      context.go('/view-event');
                    }
                  },
                  child: const Text('Guardar cambios'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}