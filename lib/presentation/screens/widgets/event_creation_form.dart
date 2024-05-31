

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manejador_eventos/models/event_model.dart';
import 'package:manejador_eventos/presentation/providers/auth_provider.dart';
import 'package:manejador_eventos/presentation/screens/widgets/event_creation_custom_fields/inputs_creation_event_barrido.dart';

class EventCreationForm extends ConsumerStatefulWidget {

  final void Function(Event) onCreate;
  final String buttonName;
  const EventCreationForm({super.key,required this.buttonName, required this.onCreate});
  @override
  ConsumerState<EventCreationForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<EventCreationForm> {
  //final _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  late String nameEvent= '';
  late String typeEvent = 'Casual Reunion';
  late String description='';
  late String location='';
  late String date='';
  late String hourStar='';
  late String hourEnd='';
  late String capacity='';
  @override
  Widget build(BuildContext context) {
    return  Form(
          key:  _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                name_Input(
                  onChanged: (value) => nameEvent=value
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                Type_Event(
                  onChanged: (value) =>  typeEvent = value,
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                Description_Input(
                  onChanged: (value) => description = value
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                address_input(
                  onChanged: (value) => location=value
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                Date_Input(
                  onChanged: (value) => date = value.toString(),
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                HourStart_input(
                  onChanged: (value) => hourStar = value.hour.toString()
                ),          
                const Padding(padding: EdgeInsets.only(top: 12)),
                //hora del final del evento
                HourEnd_input(
                  onChanged: (value) => hourEnd = value.hour.toString(),
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                Capacity_input(
                  onChanged: (value) =>  capacity = value.toString(),
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                ElevatedButton(
                  onPressed: (){
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final user = ref.watch(authProvider);
                //crear helper
                final event = Event(
                    id: '',
                    nameEvent: nameEvent,
                    typeEvent: typeEvent,
                    description: description,
                    location: location,
                    date: date,
                    hourStar: hourStar,
                    hourEnd: hourEnd,
                    capacity: capacity,
                    owner: user?.username ?? '',
                    availability: int.parse(capacity)
                    
                  );
                  widget.onCreate(event);
              }
            }, 
                  child: const Text('Crear evento')
                  )
                ],
                ),
          )
          );
  }


}