import 'package:flutter/material.dart';

class Email_Input extends StatelessWidget {
  final Function(String)? onChanged;

  const Email_Input({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        label: const Text("Correo"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Es obligatorio llenar el campo";
        }
        return null;
      },
      onSaved: (value) {
        
      },
    );
  }
}