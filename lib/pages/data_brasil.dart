import 'package:flutter/material.dart';

class DataBrasil extends StatefulWidget {
  const DataBrasil({super.key});

  @override
  State<DataBrasil> createState() => _DataBrasilState();
}

class _DataBrasilState extends State<DataBrasil> {
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
                    print("Hello, It's me data!");
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Data Brasil'),
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
