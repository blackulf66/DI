import 'package:flutter/material.dart';
import 'package:flutter_tmdb/pages/principal.dart';


void main() {
  runApp(const MyApp22());
}

class MyApp22 extends StatelessWidget {
  const MyApp22({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Principal(),
        
        
      },
    );
  }
}