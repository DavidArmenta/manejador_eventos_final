import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/models/event_model.dart';
import 'package:manejador_eventos/presentation/providers/event_provider.dart';
import 'package:manejador_eventos/presentation/screens/widgets/event_creation_form.dart';
class CreationEventPage extends ConsumerStatefulWidget {
  const CreationEventPage({super.key});
  @override
  ConsumerState createState(){
  return _CreationEventPage();
  
} 
}
class _CreationEventPage extends ConsumerState<CreationEventPage> {
// ignore: unused_field
  final _formkey=GlobalKey<FormState>();
  late String title= '';
  late String typeEvent='';
  late String description='';
  late String location='';
  late String date='';
  late String hourStar='';
  late String hourEnd='';
  @override
  void initState(){
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Creacion de Evento'),
          
        ),
        body: SingleChildScrollView(
          child: Column(children: [  
            EventCreationForm(
              buttonName: 'Dar de alta evento',
              onCreate: _createEvent 
            ),
            ],
          
          ), 
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end, 
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              FloatingActionButton(onPressed :(){
              context.go('/menu-page');
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: const Icon(Icons.keyboard_return),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _createEvent(Event event) async {
    try {
    await ref.read(eventProvider.notifier).createEvent(event);
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Creacion de Evento!'),
        icon: Icon(Icons.password_sharp),
        content: Text('Su evento se creo exitosamente!'),
      ),
    );
    Future.delayed(const Duration(seconds: 4));
    context.go('/menu-page');
  } 
  catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        icon: Icon(Icons.error),
        content: Text('No se pudo crear el evento. Intente nuevamente. \nError: ${e.toString()}'),
      ),
    );
  }
}

}