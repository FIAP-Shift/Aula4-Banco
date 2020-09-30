import 'package:flutter/material.dart';
import 'package:flutter_shift_bd/firebase/listCar.dart';
import 'package:flutter_shift_bd/home.dart';
import 'package:flutter_shift_bd/nosql/listBooks.dart';
import 'package:flutter_shift_bd/sqlite/listPerson.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //rotas nomeadas
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/sqlite': (context) => ListPerson(),
        '/nosql': (context) => ListBooks(),
        '/firebase': (context) => ListCars(),
      },
    );
  }
}

