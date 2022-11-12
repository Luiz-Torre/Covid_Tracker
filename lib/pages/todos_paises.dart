import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'requisitorapi.dart';

class TodosPaises extends StatefulWidget {
  const TodosPaises({super.key});

  @override
  State<TodosPaises> createState() => _TodosPaisesState();
}

class _TodosPaisesState extends State<TodosPaises> {
  Future<List<CovidTodosPais>> fetchGet() async {
    final response = await http.get(
        Uri.parse("https://covid19-brazil-api.now.sh/api/report/v1/countries"));

    var dados = json.decode(response.body)["data"];

    List<CovidTodosPais> paises = [];

    for (var atual in dados) {
      CovidTodosPais pais = CovidTodosPais(atual["country"], atual["cases"],
          atual["confirmed"], atual["deaths"], atual["recovered"]);

      paises.add(pais);
    }


    return paises;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(child: Column(          children: [
            Row(
              children: [
                const Text(
                  "      Todos os países",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 12, 21, 57),
                  ),
                ),
                SizedBox(height: 70),
              ],
            ),
                FutureBuilder<List<CovidTodosPais>>(
                future: fetchGet(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Color.fromARGB(255, 227, 229, 238),
                            child: SizedBox(
                                width: 300,
                                height: 140,
                                child: Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 12),
                                    Column(
                                        children: [
                                          Text(
                                            "Nome do País: ${snapshot.data![index].country}",
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
                                            "Confirmado ${snapshot.data![index].confirmed}",
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
                                          )
                                        ]),
                                  ],
                                ))),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                })
            
          ],),));
  }
}
