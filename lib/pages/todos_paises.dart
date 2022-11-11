import 'package:flutter/material.dart';

class TodosPaises extends StatefulWidget {
  const TodosPaises({super.key});

  @override
  State<TodosPaises> createState() => _TodosPaisesState();
}

class _TodosPaisesState extends State<TodosPaises> {
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
