class Event {
  String id;
  final String nameEvent;
  final String typeEvent;
  final String description;
  final String location;
  final String date;
  final String hourStar;
  final String hourEnd;
  final String capacity;
  late int availability;
  final String owner;

  Event({
    required this.id,
    required this.nameEvent,
    required this.typeEvent,
    required this.description,
    required this.location,
    required this.date,
    required this.hourStar,
    required this.hourEnd,
    required this.availability,
    required this.capacity,
    required this.owner
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameEvent': nameEvent,
      'typeEvent': typeEvent,
      'description': description,
      'location': location,
      'date': date,
      'hourStar': hourStar,
      'hourEnd': hourEnd,
      'capacity': capacity,
      'availability': availability,
      'owner': owner,
    };
  }


  factory Event.fromMap(Map<String, dynamic> data) {
    return Event(
      id:  data['id']?? 'non',
      nameEvent: data['nameEvent'],
      typeEvent: data['typeEvent'],
      description: data['description'],
      location: data['location'],
      date: data['date'],
      hourStar: data['hourStar'],
      hourEnd: data['hourEnd'],
      capacity: data['capacity'].toString(),
      owner: data['owner']?? 'Not Registered', 
      availability: data['availability']?? 0,
    );
  }

}