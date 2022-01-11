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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/path_logo.png',
            ),
            const Text(
              'beautiful, private sharing',
            ),
            Container(
              margin: const EdgeInsets.only(top:(200.0)),
              child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'sign up',
                      style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red , fontSize: 20),
                    ),
                  ),
                ),
            ),
            Container(
              margin: const EdgeInsets.only(top:(20.0)),
              child: const Text(
                  'already have a path account',
                ),

            ),
              
               SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text(
                    'log in',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:(30.0)),
                child: const Text(
                'by using path, you agree to paths',
              ),
              ),
              const Text(
                'terms of use and privacy policy. ',
              ),
          ],
        ),
      ),
      backgroundColor: const Color(0XFFE62F16),
    );
  }
}
