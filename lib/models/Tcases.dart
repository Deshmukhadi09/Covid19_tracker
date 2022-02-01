class Tcases
{
  late var cases;
  late var deaths;
  late var recovered;
  late var updated;

Tcases({required this.cases, required this.deaths, required this.recovered, required this.updated});


 factory Tcases.fromJson(final json)
 {
   return Tcases(    
    cases:json["cases"],
    deaths : json["deaths"],
    recovered : json["recovered"],
    updated : json["updated"],
   );
 }
}