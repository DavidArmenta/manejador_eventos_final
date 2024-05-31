
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/presentation/providers/auth_provider.dart';
import 'package:manejador_eventos/presentation/screens/widgets/authForms/login_register_form.dart';
import 'package:manejador_eventos/presentation/providers/messaging.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState(){
  return _LoginPageState();
  
} 
}

class _LoginPageState extends ConsumerState<LoginPage> {


  late String email = '',password = '';

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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'LogIn',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoginRegisterForm(
                  buttonName: "LogIn",
                  onLogin: (email, password) {
                    ref.read(authProvider.notifier).login(email, password, context);
                    }, 
                ),
              ),
              TextRegister(),
            ],
          ),
        ),
      ),
    );
  }


// void _validateLogin(String email, String password) async {
//     var result = await _auth.signInEmailAndPassword(email, password);

//     if (result == true) {
//       context.go('/menu-page');
//     }else 
//     {
//       String resultTexto = result.toString();
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Error al Iniciar Sesion'),
//           icon: const Icon(Icons.password_sharp),
//           content: Text(resultTexto),
//         ),
//       );
//     }
//   }

Widget TextRegister(){
  return Row(
    children: [
     const Text('¿Eres nuevo?'),
      TextButton(onPressed: (){
      context.go('/new-user');  
      }, child: const Text('¡Registrate aqui! ')),
      ],
    );
  }
}