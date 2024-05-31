import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/controller/auth_controller/auth.dart';
import 'package:manejador_eventos/presentation/providers/auth_provider.dart';


class MenuPage extends ConsumerWidget {
  const MenuPage({super.key, });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authNotifier = ref.watch(authProvider);
    final currentUser = authNotifier?.username;
    const double sizedBoxHeight = 20;
    final AuthService authService = AuthService();


    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.tealAccent.shade700,
        title:  Flexible(
          fit: FlexFit.tight,
          child: Text("Bienvenido $currentUser")
          ),
        centerTitle: true,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          const SizedBox(
            height: sizedBoxHeight,
          ),
          ListTile(
            title: const Text('Creacion de evento'),
            subtitle: const Text('proximamente'),
            tileColor: Colors.cyan,
            onTap: () => context.go('/creation-event'),
          ),
          const SizedBox(
            height: sizedBoxHeight,
          ),
          ListTile(
            title: const Text('Ver eventos'),
            subtitle: const Text('proximamente'),
            tileColor: Colors.red,
            onTap:() => context.go('/view-event'),
            ),
            const SizedBox(
            height: sizedBoxHeight,
          ),
            ListTile(
            title: const Text('Eventos que asistiré'),
            subtitle: const Text('proximamente'),
            tileColor: Colors.orange,
            onTap:() => context.go('/view-event'),
            )
          ],
        ),
      ),
      
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end, 
        crossAxisAlignment: CrossAxisAlignment.end, 
        children: [
          FloatingActionButton(
            tooltip: "Cerrar Sesion",
            elevation: 6,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: (){
              authService.signOut();
              context.go('/login-page');
          },
            child: const Icon(Icons.logout_sharp)
            ), 
        ],
      ), 
    );
  }
}
