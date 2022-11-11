// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:covid_tracker/pages/brasil.dart';
import 'package:covid_tracker/pages/geral_brasil.dart';
import 'package:covid_tracker/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CovidTracker',
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    initialRoute: '/',
    routes: {
      '/': (_) => Home(),
    },
  ));
}
