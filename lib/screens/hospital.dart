import 'package:covide_tracker/models/Hbed.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hospital extends StatefulWidget {
  const Hospital({Key? key}) : super(key: key);
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  // noSuchMethod(Invocation i) => super.noSuchMethod(i);

  final String url = "https://api.rootnet.in/covid19-in/stats/hospitals";

  @override
  void initState() {
    super.initState();

    getJsonData();
  }

  Future<Hbeds> getJsonData() async {
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body)['data']['summary'];

      return Hbeds.fromJson(convertDataJson);
    } else {
      throw Exception('Try to  Reload Page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Indian Hospitals statistics'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purpleAccent, Colors.cyan],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0)
                    // bottomLeft: Radius.circular(40.0),
                    // bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                            )
                          ),
                          child: const Image(
                            image: AssetImage("assets/images/heart.png"),
                            height: 250,
                            width: 250,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20.0)),
                        Card(
                            color: const Color(0xFF292929),
                            child: ListTile(
                                title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const <Widget>[
                                  Text(
                                    "Total Hospitals ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total Beds",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Text("Recoveries",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                ]))),
                        FutureBuilder<Hbeds>(
                            future: getJsonData(),
                            builder: (BuildContext context, snapShot) {
                              if (snapShot.hasData) {
                                final covid = snapShot.data;
                                return Column(children: <Widget>[
                                  Card(
                                      color: const Color(0xFF292929),
                                      child: ListTile(
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                            Text(
                                              "   ${covid?.totalHospitals} ",
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "     ${covid?.totalBeds}",
                                              style: const TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //Text("${covid.discharged}",style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold)),
                                          ]))),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 10.0)),
                                  Card(
                                      color: const Color(0xFF292929),
                                      child: ListTile(
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const <Widget>[
                                            Text(
                                              "Urban Hospitals ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Total Beds",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //Text("${covid.discharged}",style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold)),
                                          ]))),
                                  Card(
                                      color: const Color(0xFF292929),
                                      child: ListTile(
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                            Text(
                                              "   ${covid?.urbanHospitals} ",
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "      ${covid?.urbanBeds}",
                                              style: const TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //Text("${covid.discharged}",style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold)),
                                          ]))),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 10.0)),
                                  Card(
                                      color: const Color(0xFF292929),
                                      child: ListTile(
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const <Widget>[
                                            Text(
                                              "Rural Hospitals ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Total Beds",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // Text("Recoveries",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                          ]))),
                                  Card(
                                      color: const Color(0xFF292929),
                                      child: ListTile(
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                            Text(
                                              "${covid?.ruralHospitals} ",
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${covid?.ruralBeds}",
                                              style: const TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //Text("${covid.discharged}",style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold)),
                                          ]))),
                                ]);
                              } else if (snapShot.hasError) {
                                return Text(snapShot.error.toString());
                              }

                              return const CircularProgressIndicator();
                            }),
                      ]),
                ))));
  }
}
