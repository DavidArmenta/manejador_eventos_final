import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/presentation/providers/auth_provider.dart';
import 'package:manejador_eventos/presentation/screens/widgets/authForms/register_form.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});
  
  @override
  
  ConsumerState createState(){
    return _RegistrationPageStateState();

  }
  

}

class _RegistrationPageStateState extends ConsumerState<RegistrationPage> {



  late String email = '',password = '',name = '', username = '';
 

  @override
  void initState(){
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Event Manager App'),
          backgroundColor: Colors.tealAccent.shade700,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
              children: [
                //Image(image: AssetImage(""),),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Registrar Usuario ',style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                child: RegisterForm(
                  onLogin: (email, password,username) {
                    ref.read(authProvider.notifier).validateRegister(email, password, username, context);
                    },
                  buttonName: "Registrar Cuenta")
                )
              ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Volver a pantalla de Login',
        onPressed: (){
            context.go('/login-page');
        },child: const Icon(Icons.arrow_back)),  
      ),
    );
  }

}