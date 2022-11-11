import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'requisitorapi.dart';

const List<String> list = <String>[
  'AC',
  'AL',
  'AM',
  'AP',
  'BA',
  'CE',
  'DF',
  'ES',
  'GO',
  'MA',
  'MG',
  'MS',
  'MT',
  'PA',
  'PB',
  'PE',
  'PI',
  'PR',
  'RJ',
  'RN',
  'RO',
  'RR',
  'RS',
  'SC',
  'SE',
  'SP',
  'TO'
];

class Estado extends StatefulWidget {
  const Estado({super.key});

  @override
  State<Estado> createState() => _EstadoState();
}

class _EstadoState extends State<Estado> {
  String dropdownValue = list.first;
  Future<CovidEstado> fetchGet() async {
    final response = await http.get(Uri.parse(
        "https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/${dropdownValue}"));

    return CovidEstado.fromJson(json.decode(response.body));
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
                  "      Selecione o estado que deseja saber os dados:  ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            FutureBuilder<CovidEstado>(
                future: fetchGet(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
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

                                    Row(children: [SizedBox(width: 12),Text("Sigla do estado",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 56, 57, 58),),)]),
                                    SizedBox(height: 13),

                                    Row(children: [
                                    Icon(
                                      Icons.location_city,
                                      color: Color.fromARGB(255, 67, 66, 66),
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 115),
                                    Text("${snapshot.data!.uf}",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 1, 33, 65),)),
                                    ],)
                                  ],))),
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

                                    Row(children: [SizedBox(width: 12),Text("Estado",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 56, 57, 58),),)]),
                                    SizedBox(height: 13),

                                    Row(children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromARGB(255, 67, 66, 66),
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 115),
                                    Text("${snapshot.data!.state}",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 1, 33, 65),)),
                                    ],)
                                  ],))),
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

                                    Row(children: [SizedBox(width: 12),Text("Casos",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 56, 57, 58),),)]),
                                    SizedBox(height: 13),

                                    Row(children: [
                                    Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 67, 66, 66),
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 115),
                                    Text("${snapshot.data!.cases}",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 1, 33, 65),)),
                                    ],)
                                  ],))),
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

                                    Row(children: [SizedBox(width: 12),Text("Mortes",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 56, 57, 58),),)]),
                                    SizedBox(height: 13),

                                    Row(children: [
                                    Icon(
                                      Icons.heart_broken_sharp,
                                      color: Color.fromARGB(255, 67, 66, 66),
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 115),
                                    Text("${snapshot.data!.deaths.toString()}",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 1, 33, 65),)),
                                    ],)
                                  ],))),
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

                                    Row(children: [SizedBox(width: 12),Text("Suspeitos",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 56, 57, 58),),)]),
                                    SizedBox(height: 13),

                                    Row(children: [
                                    Icon(
                                      Icons.mode_outlined,
                                      color: Color.fromARGB(255, 67, 66, 66),
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 115),
                                    Text("${snapshot.data!.suspects.toString()}",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 1, 33, 65),)),
                                    ],)
                                  ],))),
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

                                    Row(children: [SizedBox(width: 12),Text("Recusados",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 56, 57, 58),),)]),
                                    SizedBox(height: 13),

                                    Row(children: [
                                    Icon(
                                      Icons.insert_emoticon,
                                      color: Color.fromARGB(255, 67, 66, 66),
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 115),
                                    Text("${snapshot.data!.refuses.toString()}",style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 1, 33, 65),)),
                                    ],)
                                  ],))),
                              ),
                              
                          ]
                          ),                     
                        );
                  } else if (snapshot.hasError) {
                    return Text("Teste ${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                })
          ],
        )));
  }
}


