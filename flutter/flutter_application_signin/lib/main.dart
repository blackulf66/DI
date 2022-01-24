import 'package:flutter/material.dart';
import 'package:flutter_application_signin/pantalla2.dart';



void main() {
  runApp(const MyApp22());
}

class MyApp22 extends StatelessWidget {
  const MyApp22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp22(),
        '/main':(context) => const MyApp(),
      },
    );
  }
}