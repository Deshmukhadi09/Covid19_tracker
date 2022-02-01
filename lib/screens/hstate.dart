import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class Hstate extends StatefulWidget {
  const Hstate({Key? key}) : super(key: key);
  @override
  _HstateState createState() => _HstateState();
}

class _HstateState extends State<Hstate> {
  final String url = "0";

  late Future<List> datas;

  Future<List> getHData() async {
    var response = await Dio().get(url);
    return response.data['data']['regional'];
  }

  @override
  void initState() {
    super.initState();
    datas = getHData();
  }

  Future showcard(String ind, inter, recover, death, hospital, beds) async {
    await showDialog(
        context: context,
        builder: (BuildContext contect) {
          return AlertDialog(
            backgroundColor: const Color(0xFF363636),
            shape: const RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    "Total Hospital :$ind",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    "Beds :$inter",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    "Total Hospitals in urban Area :$recover",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    "Beds :$death",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    "Total Hospitals in rural area:$hospital",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    "Beds :$beds",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Statewise Statistics'),
            backgroundColor: const Color(0xFF152238)),
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: datas,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  debugPrint(snapshot.data);
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.0,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0),
                      itemCount: 37,
                      itemBuilder: (BuildContext context, index) => SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: GestureDetector(
                              onTap: () => showcard(
                                  snapshot.data[index]['totalHospitals']
                                      .toString(),
                                  snapshot.data[index]['totalBeds'].toString(),
                                  snapshot.data[index]['urbanHospitals']
                                      .toString(),
                                  snapshot.data[index]['urbanBeds'].toString(),
                                  snapshot.data[index]['ruralHospitals']
                                      .toString(),
                                  snapshot.data[index]['ruralBeds'].toString()),
                              child: Card(
                                //elevation: 10,
                                // child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),

                                child: Container(
                                    color: const Color(0xFF292929),
                                    child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0)),
                                            Text(
                                              'Total Beds:${snapshot.data[index]['totalBeds'].toString()}',
                                              style: const TextStyle(
                                                  color: Color(0xFF45b6fe),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0)),
                                            const Image(
                                              image: AssetImage(
                                                  "assets/images/heart.png"),
                                              height: 100,
                                              width: 100,
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0)),
                                            Text(
                                              snapshot.data[index]['state'],
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ]),
                                    )),
                              ))));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }
}
