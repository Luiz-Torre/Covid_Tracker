import 'package:flutter/material.dart';

class ConsultaPais extends StatefulWidget {
  const ConsultaPais({super.key});

  @override
  State<ConsultaPais> createState() => _ConsultaPaisState();
}

class _ConsultaPaisState extends State<ConsultaPais> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Center(
            child: Column(
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    print("Hello, It's me! TodosPaises");
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Tdos os paises'),
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
