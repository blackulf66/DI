import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/carmen.png"),
                      fit: BoxFit.cover))),
          Container(
              margin: const EdgeInsets.only(top: 44.0, right: 20.0),
              alignment: Alignment.topRight,
              child: const Text(
                'skippy',
                textAlign: TextAlign.right,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
              )),
          Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/redbull.png', width: 177),
                  const Text(
                    'Sign In to get the most of Red Bull',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: const Text(
                      'Create an account to save favorites',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Text(
                    'and download videos to watch anytime you want',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 350,
                    child: Container(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: SignInButton(
                        Buttons.FacebookNew,
                        text: 'Sign in with Facebook',
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: SignInButton(
                      Buttons.Google,
                      text: 'Sign up with Google',
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: const Text(
                      'continue with email',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )))
        ],
      )),
    );
  }
}
