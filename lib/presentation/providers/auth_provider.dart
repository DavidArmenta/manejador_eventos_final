import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/controller/auth_controller/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:manejador_eventos/models/user_model.dart";

final authProvider = NotifierProvider<AuthNotifier, UserModel?>(AuthNotifier.new);


class AuthNotifier extends Notifier<UserModel?> {
  final AuthService _auth = AuthService();

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  @override
  UserModel? build() {
    return _currentUser;
  }

  Future<void> login(String email, String password, BuildContext context) async {
    var result = await _auth.signInEmailAndPassword(email, password);
    if (result == true) {
      _currentUser =await  _auth.getCurrentUser();
      state = _currentUser;
      context.go('/menu-page');
    } else {
      String resultTexto = result.toString();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error al Iniciar Sesion'),
          icon: const Icon(Icons.password_sharp),
          content: Text(resultTexto),
        ),
      );
    }
  }

  Future <void> validateRegister(String email , String password, String username, BuildContext context) async {
    var result = await _auth.createAccount(email, password , username);
    if (result == true) {
      _currentUser = _auth.currentUser;
      showDialog(
        context: context, 
        builder: (context)=> const AlertDialog(
          title: Text('Su cuenta se creo exitosamente!'),
          icon: Icon(Icons.password_sharp),
          content: Text('Ahora inicie sesion con su cuenta'),
        )
        );
      await Future.delayed(const Duration(seconds: 3));
      context.go('/login-page');
    } 
    else
    {
      showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
          title: const Text('Error al crear cuenta.'),
          icon: const Icon(Icons.password_sharp),
          content: Text(result),
        )
        );
    }
}


Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    _currentUser = null;
    state = _currentUser;
    context.go('/login-page');
  }

}