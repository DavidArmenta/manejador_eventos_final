
import 'package:flutter/material.dart';

class Type_Event extends StatefulWidget {

  final String? initialValue;
  final ValueChanged<String> onChanged;
  const Type_Event({super.key, required this.onChanged, this.initialValue });

  @override
  _Type_EventState createState() => _Type_EventState();
}
class _Type_EventState extends State<Type_Event> {
  // ignore: unused_field
  String _selectedOption = 'Casual Reunion';

   @override
    void initState() {
      super.initState();
      _selectedOption = widget.initialValue?? 'Casual Reunion';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Tipo De Evento',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      value: _selectedOption, // Valor seleccionado
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue?? ''; // Actualizar el valor seleccionado
          widget.onChanged(_selectedOption); 
        });
      },
      items: <String>['BirthDay', 'Casual Reunion', 'Family Reunion', 'Carnita Asada' , 'Graduation Party']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value), // Texto de la opción
        );
      }).toList(),
    );
  }
}