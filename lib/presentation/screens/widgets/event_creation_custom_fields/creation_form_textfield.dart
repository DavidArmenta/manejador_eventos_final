import 'package:flutter/material.dart';

class CreationFormField extends StatelessWidget {
  final String labelText;
  const CreationFormField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
  decoration: InputDecoration(
    labelText: labelText,
    border: OutlineInputBorder(
      borderRadius:  BorderRadius.circular(8),
      borderSide:  const BorderSide(color: Colors.black)
      )
    ),
  );
  }
}