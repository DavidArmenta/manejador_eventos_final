import 'package:flutter/material.dart';
class HourEnd_input extends StatefulWidget{
    final TimeOfDay? initialValue;
    final ValueChanged<TimeOfDay> onChanged;

    const HourEnd_input({super.key, required this.onChanged, this.initialValue});

      @override
      _HourEndState createState(){
      return _HourEndState();
}
}
class _HourEndState extends State<HourEnd_input>{

  TimeOfDay selectedTime=TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialValue?? TimeOfDay.now();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("${selectedTime.hour}:${selectedTime.minute}"),
          ElevatedButton(
            child: const Text('Elige la hora de cierre'),
            onPressed: () async{
              final TimeOfDay? timeOfDay = await showTimePicker(
                
                context: context, 
                initialTime: selectedTime,
                initialEntryMode: TimePickerEntryMode.dial,
                );
                if(timeOfDay != null)
                {
                  setState(() {
                    selectedTime= timeOfDay;
                  });
                  widget.onChanged(timeOfDay);
                }
            },),
        ],
      ),
    );
  }
}