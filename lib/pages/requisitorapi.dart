import 'dart:convert';


class CovidEstado {
  int uid;
  String uf;
  String state;
  int cases;
  int deaths;
  int suspects;
  int refuses;
  DateTime datetime;
  CovidEstado({
    required this.uid,
    required this.uf,
    required this.state,
    required this.cases,
    required this.deaths,
    required this.suspects,
    required this.refuses,
    required this.datetime,
  });
  factory CovidEstado.fromJson(Map<String, dynamic> json) => CovidEstado(
        uid: json["uid"],
        uf: json["uf"],
        state: json["state"],
        cases: json["cases"],
        deaths: json["deaths"],
        suspects: json["suspects"],
        refuses: json["refuses"],
        datetime: DateTime.parse(json["datetime"]),
    );
}
