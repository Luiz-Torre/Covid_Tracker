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



class Covid {
    Covid({
        required this.uid,
        required this.uf,
        required this.state,
        required this.cases,
        required this.deaths,
        required this.suspects,
        required this.refuses,
        required this.broadcast,
        required this.comments,
        required this.datetime,
    });

    int? uid;
    String? uf;
    String? state;
    int? cases;
    int? deaths;
    int? suspects;
    int? refuses;
    bool? broadcast;
    String? comments;
    DateTime? datetime;

    factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        uid: json["uid"],
        uf: json["uf"],
        state: json["state"],
        cases: json["cases"],
        deaths: json["deaths"],
        suspects: json["suspects"],
        refuses: json["refuses"],
        broadcast: json["broadcast"],
        comments: json["comments"],
        datetime: DateTime.parse(json["datetime"]),
    );
}
