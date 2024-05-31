import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manejador_eventos/presentation/screens/widgets/login_register_custom_fields/email_input.dart';
import 'package:manejador_eventos/presentation/screens/widgets/login_register_custom_fields/password_input.dart';
import 'package:manejador_eventos/presentation/screens/widgets/login_register_custom_fields/user_input.dart';


class RegisterForm extends StatefulWidget {
  final void Function(String, String, String) onLogin;
  final String buttonName;

  const RegisterForm({super.key, required this.onLogin, required this.buttonName});

  @override
  State<RegisterForm> createState() => _LoginFormState();
}


class _LoginFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String email = '';
  late String password = '';
  late String username = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          User_Input(
            onChanged: (value) => username = value,
          ),
          const SizedBox(
            height: 10,
          ),
          Email_Input(
            onChanged: (value) => email = value,
          ),
          const SizedBox(
            height: 10,
          ),
          PasswordInput(
            onChanged: (value) => password = value,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onLogin(email, password,username);
              }
            },
            child: Text(widget.buttonName),
          ),
        ],
      ),
    );
  }
}