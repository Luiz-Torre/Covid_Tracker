import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'requisitorapi.dart';

class GeralBrasil extends StatefulWidget {
  const GeralBrasil({super.key});

  @override
  State<GeralBrasil> createState() => _GeralBrasilState();
}

class _GeralBrasilState extends State<GeralBrasil> {
  Future<Covid> fetchGet() async {
    final response = await http.get(Uri.parse(
        "https://covid19-brazil-api.vercel.app/api/report/v1/brazil"));
    print(Covid.fromJson(json.decode(response.body)));
    return Covid.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "      Dados Gerais do Brasil",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            FutureBuilder<Covid>(
                future: fetchGet(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(children: [
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Sigla do estado",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_city,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text("${snapshot.data!.uf}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Estado",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text("${snapshot.data!.state}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Casos",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text("${snapshot.data!.cases}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Mortes",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.heart_broken_sharp,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text(
                                          "${snapshot.data!.deaths.toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Suspeitos",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mode_outlined,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text(
                                          "${snapshot.data!.suspects.toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Recusados",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.insert_emoticon,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text(
                                          "${snapshot.data!.refuses.toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                      ]),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                })
          ],
        )));
  }
}
