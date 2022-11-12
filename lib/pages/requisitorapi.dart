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

class CovidPais {
  CovidPais({
    required this.country,
    required this.cases,
    required this.deaths,
    required this.confirmed,
    required this.recovered,
  });

  String? country;
  int? cases;
  int? deaths;
  int? confirmed;
  int? recovered;

  factory CovidPais.fromJson(Map<String, dynamic> json) {
    json = json['data'];
    return CovidPais(
      country: json["country"],
      cases: json["cases"],
      deaths: json["deaths"],
      confirmed: json["confirmed"],
      recovered: json["recovered"],
    );
  }
}

class CovidTodosPais {
  CovidTodosPais(
    this.country,
    this.cases,
    this.deaths,
    this.confirmed,
    this.recovered,
  );

  final String country;
  final int? cases;
  final int? deaths;
  final int? confirmed;
  final int? recovered;
}

class CovidData {
  CovidData(
    this.uf,
    this.cases,
    this.deaths,
    this.suspects,
    this.recovered,
    this.refuses
  );

  final String uf;
  final int? cases;
  final int? deaths;
  final int? suspects;
  final int? recovered;
  final int? refuses;
}
