import 'package:flutter/material.dart';
class address_input extends StatelessWidget{
  final String? initialValue;
  final Function(String)? onChanged;
  const address_input({super.key,this.onChanged, this.initialValue = ''});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        label:  const Text("Direccion"),
        hintText: 'Calle Numero Fraccionamiento',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      validator: (value){
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
