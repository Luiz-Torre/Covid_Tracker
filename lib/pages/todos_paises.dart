import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
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

    var dados = json.decode(response.body);

    List<CovidTodosPais> paises = [];

    for (var atual in dados["data"]) {
      CovidTodosPais pais = CovidTodosPais(atual["country"], atual["cases"],
          atual["confirmed"], atual["deaths"], atual["recovered"]);

      print(pais.country);
      paises.add(pais);
    }

    print(paises.length);

    return paises;
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
            FutureBuilder<List<CovidTodosPais>>(
                future: fetchGet(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data![index].country);
                    },
                  );
                  }
                  //       return Padding(
                  //         padding: EdgeInsets.all(15.0),
                  //         child: Column(children: [

                  //           Card(
                  //             color: Color.fromARGB(255, 227, 229, 238),
                  //             child: SizedBox(
                  //                 width: 300,
                  //                 height: 85,
                  //                 child: Center(
                  //                     child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     SizedBox(height: 8),
                  //                     Row(children: [
                  //                       SizedBox(width: 12),
                  //                       Text(
                  //                         "Casos",
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Color.fromARGB(255, 56, 57, 58),
                  //                         ),
                  //                       )
                  //                     ]),
                  //                     SizedBox(height: 13),
                  //                     Row(
                  //                       children: [
                  //                         Icon(
                  //                           Icons.insert_chart,
                  //                           color: Color.fromARGB(255, 67, 66, 66),
                  //                           size: 30.0,
                  //                         ),
                  //                         SizedBox(width: 115),
                  //                         Text("${snapshot.data!.cases}",
                  //                             style: TextStyle(
                  //                               fontWeight: FontWeight.bold,
                  //                               color:
                  //                                   Color.fromARGB(255, 1, 33, 65),
                  //                             )),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ))),
                  //           ),
                  //           Card(
                  //             color: Color.fromARGB(255, 227, 229, 238),
                  //             child: SizedBox(
                  //                 width: 300,
                  //                 height: 85,
                  //                 child: Center(
                  //                     child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     SizedBox(height: 8),
                  //                     Row(children: [
                  //                       SizedBox(width: 12),
                  //                       Text(
                  //                         "Confirmado",
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Color.fromARGB(255, 56, 57, 58),
                  //                         ),
                  //                       )
                  //                     ]),
                  //                     SizedBox(height: 13),
                  //                     Row(
                  //                       children: [
                  //                         Icon(
                  //                           Icons.person,
                  //                           color: Color.fromARGB(255, 67, 66, 66),
                  //                           size: 30.0,
                  //                         ),
                  //                         SizedBox(width: 115),
                  //                         Text("${snapshot.data!.confirmed}",
                  //                             style: TextStyle(
                  //                               fontWeight: FontWeight.bold,
                  //                               color:
                  //                                   Color.fromARGB(255, 1, 33, 65),
                  //                             )),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ))),
                  //           ),
                  //           Card(
                  //             color: Color.fromARGB(255, 227, 229, 238),
                  //             child: SizedBox(
                  //                 width: 300,
                  //                 height: 85,
                  //                 child: Center(
                  //                     child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     SizedBox(height: 8),
                  //                     Row(children: [
                  //                       SizedBox(width: 12),
                  //                       Text(
                  //                         "Mortes",
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Color.fromARGB(255, 56, 57, 58),
                  //                         ),
                  //                       )
                  //                     ]),
                  //                     SizedBox(height: 13),
                  //                     Row(
                  //                       children: [
                  //                         Icon(
                  //                           Icons.heart_broken_sharp,
                  //                           color: Color.fromARGB(255, 67, 66, 66),
                  //                           size: 30.0,
                  //                         ),
                  //                         SizedBox(width: 115),
                  //                         Text(
                  //                             "${snapshot.data!.deaths.toString()}",
                  //                             style: TextStyle(
                  //                               fontWeight: FontWeight.bold,
                  //                               color:
                  //                                   Color.fromARGB(255, 1, 33, 65),
                  //                             )),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ))),
                  //           ),
                  //           Card(
                  //             color: Color.fromARGB(255, 227, 229, 238),
                  //             child: SizedBox(
                  //                 width: 300,
                  //                 height: 85,
                  //                 child: Center(
                  //                     child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     SizedBox(height: 8),
                  //                     Row(children: [
                  //                       SizedBox(width: 12),
                  //                       Text(
                  //                         "Recuperados",
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Color.fromARGB(255, 56, 57, 58),
                  //                         ),
                  //                       )
                  //                     ]),
                  //                     SizedBox(height: 13),
                  //                     Row(
                  //                       children: [
                  //                         Icon(
                  //                           Icons.insert_emoticon,
                  //                           color: Color.fromARGB(255, 67, 66, 66),
                  //                           size: 30.0,
                  //                         ),
                  //                         SizedBox(width: 115),
                  //                         Text(
                  //                             "${snapshot.data!.recovered.toString()}",
                  //                             style: TextStyle(
                  //                               fontWeight: FontWeight.bold,
                  //                               color:
                  //                                   Color.fromARGB(255, 1, 33, 65),
                  //                             )),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ))),
                  //           ),
                  //         ]),
                  //       );
                  //     }
                  else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                })
          ],
        )));
  }
}
