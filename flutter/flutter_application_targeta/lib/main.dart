import 'package:flutter/material.dart';

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
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'shubidubidubidubashubidubidarara'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 300,
                width: 400,
                child: const Card(
                  child: ListTile(
                    title: Text(
                        "20:55"),
                  ),
                  elevation: 10,
                  shadowColor: Colors.purple,
                  margin: EdgeInsets.all(20),
                ),
               ),
               Container(
                height: 300,
                width: 400,
                child: const Card(
                  child: ListTile(
                    title: Text(
                        "yo soy como la sirenita , por arriba tengo teta por abajo la colita"),
                  ),
                  elevation: 10,
                  shadowColor: Colors.purple,
                  margin: EdgeInsets.all(20),
                ),
               ),
          ],
        ),
      ),
    );
  }
}
