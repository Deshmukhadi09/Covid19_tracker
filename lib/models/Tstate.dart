class Tstate {
  final String state;
  final String ruralHospitals;
  final String ruralBeds;
  final String urbanHospitals;
  final String urbanBeds;
  final String totalHospitals;
  final String totalBeds;

Tstate({required this.state, required this.ruralHospitals, required this.ruralBeds,required this.urbanHospitals,required this.urbanBeds,required this.totalHospitals,required this.totalBeds});
  factory Tstate.fromJson(Map<String, dynamic> json)
  {
    return Tstate(
     state: json["state"],  
     ruralHospitals:json["ruralHospitals"],     
     ruralBeds : json["ruralBeds"],
     urbanHospitals : json["urbanHospitals"],
    urbanBeds : json["urbanBeds"],
    totalHospitals : json["totalHospitals"],
    totalBeds : json["totalBeds"],

    );
 }
}

