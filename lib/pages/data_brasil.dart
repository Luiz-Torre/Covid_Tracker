import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'requisitorapi.dart';

class DataBrasil extends StatefulWidget {
  const DataBrasil({super.key});

  @override
  State<DataBrasil> createState() => _DataBrasilState();
}

class _DataBrasilState extends State<DataBrasil> {
  TextEditingController _dataController =
      TextEditingController(text: "20200318");

  Future<List<CovidData>> fetchGet() async {
    final response = await http.get(Uri.parse(
        "https://covid19-brazil-api.now.sh/api/report/v1/brazil/${_dataController.text}"));

    var dados = json.decode(response.body)["data"];
    List<CovidData> estados = [];

    for (var atual in dados) {
      CovidData estado = CovidData(
          atual["uf"],
          atual["cases"],
          atual["suspects"],
          atual["deaths"],
          atual["suspects"],
          atual["refuses"]);
      estados.add(estado);
    }

    return estados;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: "Digite a data desejada no formato YYYYMMDD "),
                controller: _dataController,
                onEditingComplete: () {
                  setState(() {
                    fetchGet();
                  });
                },
              ),
              FutureBuilder<List<CovidData>>(
                  future: fetchGet(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      if (snapshot.data!.isEmpty) {
                        return Text(
                          "Sem dados para essa data. Tente novamente com outra data",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 127, 127, 128),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: Color.fromARGB(255, 227, 229, 238),
                                child: SizedBox(
                                    width: 300,
                                    height: 170,
                                    child: Center(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 12),
                                        Column(children: [
                                          Text(
                                            "Nome do País: ${snapshot.data![index].uf}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 56, 57, 58),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                              "Casos: ${snapshot.data![index].cases}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 56, 57, 58),
                                              )),
                                          SizedBox(height: 8),
                                          Text(
                                            "Confirmado ${snapshot.data![index].suspects}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 56, 57, 58),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Mortes: ${snapshot.data![index].deaths.toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 56, 57, 58),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Recuperados: ${snapshot.data![index].recovered.toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 56, 57, 58),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Recusados: ${snapshot.data![index].refuses.toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 56, 57, 58),
                                            ),
                                          )
                                        ]),
                                      ],
                                    ))),
                              );
                            });
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  })
            ],
          ),
        ));
  }
}
