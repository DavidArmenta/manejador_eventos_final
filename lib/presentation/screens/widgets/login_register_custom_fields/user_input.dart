import 'package:flutter/material.dart';

class User_Input extends StatelessWidget {
  final Function(String)? onChanged;

  const User_Input({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        label: const Text("UserName"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Es obligatorio llenar el campo";
        }else if (value.length < 3){
          return "El username debe tener al menos 3 caracteres";
        }
        return null;
      },
      onSaved: (value) {
        
      },
    );
  }
}