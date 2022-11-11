import 'package:covid_tracker/pages/brasil.dart';
import 'package:covid_tracker/pages/consulta_pais.dart';
import 'package:covid_tracker/pages/todos_paises.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovidTracker',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Coronavirus Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(children: [
          Center(
            child: Column(
              children: <Widget>[
                OutlinedButton(
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Brasil()),
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Brasil'),
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
                          builder: (context) => const TodosPaises()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Todos os Paises'),
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
                          builder: (context) => const ConsultaPais()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Consultar por País'),
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