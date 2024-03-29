
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StateTablePage extends StatefulWidget {
    const StateTablePage({Key? key}) : super(key: key);
  @override
  _StateTablePageState createState() => _StateTablePageState();
}

class _StateTablePageState extends State<StateTablePage> {
  String url = 'https://api.rootnet.in/covid19-in/stats/latest';
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
          "State Details",
        ),
        
      ),
      body: Container(
        child: ListView.builder(
          itemCount: result == null ? 0 : result.length,
          itemBuilder: (BuildContext context, index) {
            if (result[index]['loc'] == 'Unknown*') {
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
                                    result[index]['loc'].toString(),
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
                                    'Active Cases',
                                    style: TextStyle(
                                      color: Colors.green,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['totalConfirmed'].toString(),
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
                                    'Todays Cases',
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['confirmedCasesForeign'].toString(),
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
                                    'Total Recovered',
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['discharged'].toString(),
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
                                    'Total Deaths',
                                    style: TextStyle(
                                      color: Colors.red,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['deaths'].toString(),
                                    style: const TextStyle(
                                      color: Colors.red,
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