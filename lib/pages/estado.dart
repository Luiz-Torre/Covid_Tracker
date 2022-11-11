import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'requisitorapi.dart';

class Estado extends StatefulWidget {
  const Estado({super.key});

  @override
  State<Estado> createState() => _EstadoState();
}

class _EstadoState extends State<Estado> {
  String address = "";
  TextEditingController _UFEditingController = TextEditingController();

  Future<CovidEstado> fetchGet() async {
    print(_UFEditingController.text);

    if ((_UFEditingController.text.isNotEmpty)) {
      final response = await http.get(Uri.parse(
          "https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/${_UFEditingController.text}"));
      print(response.body);

      return CovidEstado.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load get');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: (Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _UFEditingController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe a Sigla do Estado',
                ),
              ),
            ),
            FutureBuilder<CovidEstado>(
                future: fetchGet(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(snapshot.data!.uf),
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
