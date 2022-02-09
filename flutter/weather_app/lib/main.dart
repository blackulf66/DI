import 'package:flutter/material.dart';
import 'package:weather_app/pages/pantallaSeleccionMapa.dart';
import 'package:weather_app/principal.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/seleccion': (context) => const MapClickPage(),
      },
    );
  }
}

//f28e837e4595cfac202f03b29b52beca api key