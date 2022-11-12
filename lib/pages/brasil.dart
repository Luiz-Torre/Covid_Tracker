import 'package:covid_tracker/pages/geral_brasil.dart';
import 'package:flutter/material.dart';

import 'data_brasil.dart';
import 'estado.dart';

class Brasil extends StatefulWidget {
  const Brasil({super.key});

  @override
  State<Brasil> createState() => _BrasilState();
}

class _BrasilState extends State<Brasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Center(
            child: Column(
              children: <Widget>[
                OutlinedButton(
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GeralBrasil()),
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Dado Geral do Brasil'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                OutlinedButton(
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Estado()),
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Selecionar um Estado'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataBrasil()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Selecione uma Data'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
