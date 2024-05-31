import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/presentation/providers/event_provider.dart';
import 'package:manejador_eventos/presentation/screens/widgets/viewEvent_widgets/event_card.dart';
//para ver nuestros eventos
class ViewPageScreen extends ConsumerStatefulWidget {
  const ViewPageScreen({super.key});

  @override
  ConsumerState createState(){
    return _ViewPageScreen();
  }  
}

class _ViewPageScreen extends ConsumerState<ViewPageScreen>{

  String _viewType = 'All Events';

  @override
  void initState() {
    super.initState();
    ref.read(eventProvider.notifier).fetchEvents();
  }
  
  @override
  Widget build(BuildContext context) {
  final events = ref.watch(eventProvider);

  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text("Ver Eventos"),
        centerTitle: true,
        actions: [
            DropdownButton<String>(
              value: _viewType,
              onChanged: (value) {
                setState(() {
                  _viewType = value!;
                  if (value == 'My Events') {
                    ref.read(eventProvider.notifier).fetchMyEvents();
                  } else if(value == 'All Events') {
                    ref.read(eventProvider.notifier).fetchEvents();
                  }else{
                    ref.read(eventProvider.notifier).fetchJoinedEvents();
                  }
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 'All Events',
                  child: Text('Todos los eventos.'),
                ),
                DropdownMenuItem(value: 'My Events',
                  child: Text('Mis Eventos.'),
                ),
                DropdownMenuItem(value: 'Attending Events',
                  child: Text('Evento que asistire.'),
                ),
              ],
            ),
          ],
        ),
      body: Center(
          child: events.isEmpty
              ? const Text("No hay Eventos en esta categoria :( \n¡Crea y Unete a Eventos!" , textAlign: TextAlign.center,)
              : ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return EventoCard(evento: events[index]);
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
            tooltip: "Regresar al Menu",
            elevation: 6,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: (){
              context.go('/menu-page');
          },
            child: const Icon(Icons.keyboard_return)
            ),
    ),
    
  );
}
}