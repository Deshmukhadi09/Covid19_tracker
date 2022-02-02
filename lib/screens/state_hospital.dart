
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StateTablePage1 extends StatefulWidget {
    const StateTablePage1({Key? key}) : super(key: key);
  @override
  _StateTablePage1State createState() => _StateTablePage1State();
}

class _StateTablePage1State extends State<StateTablePage1> {
  String url = 'https://api.rootnet.in/covid19-in/stats/hospitals';
   var result;

  void makeRequest() async {
    var response = await http.get(Uri.parse(url));
    setState(
      () {
        if (response.statusCode == 200) {
          result = json.decode(response.body)['data']['regional'];
        } else {
          throw ErrorDescription("Something went Wrong ...");
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "State Hospitals Details",
        ),
        
      ),
      body: Container(
        child: ListView.builder(
          itemCount: result == null ? 0 : result.length,
          itemBuilder: (BuildContext context, index) {
            if (result[index]['state'] == 'Unknown*') {
              return const Text("");
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.purpleAccent, Colors.cyan],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                  padding: const EdgeInsets.all(2.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(0.0),
                  //   color: Colors.grey[800],
                  // ),
                  child: Card(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'State',
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['state'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'RuralHospitals',
                                    style: TextStyle(
                                      color: Colors.green,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['ruralHospitals'].toString(),
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'RuralBeds',
                                    style: TextStyle(
                                      color: Colors.green,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['ruralBeds'].toString(),
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'UrbanHospitals',
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['urbanHospitals'].toString(),
                                    style: const TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'UrbanBeds',
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['urbanBeds'].toString(),
                                    style: const TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'TotalHospitals',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['totalHospitals'].toString(),
                                    style: const TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'TotalBeds',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['totalBeds'].toString(),
                                    style: const TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}