import 'package:flutter/material.dart';
import 'package:flutter_navigation_routes/pages/pantalla1.dart';
import 'package:flutter_navigation_routes/pages/pantalla3.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'el titulo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://pbs.twimg.com/profile_images/1097921359387258883/mkAwTxB1_400x400.png',
                    width: 400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SizedBox(
                width: 250,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      'Discover your dream Job Here',
                      style: TextStyle(fontSize: 30),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: 300,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      'explore all the most exiting jobs roles based on your interest and study major ',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SizedBox(
                  width: 350,
                  height: 70,
                  child: Stack(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(1, 1, 1, 0.3),
                          ),
                        ),
                         onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp3()));
                        },
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 25, right: 70),
                            child: Text(
                              'sign up',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                                  
                            ),
                            
                          )),
                      InkWell(
                        child: SizedBox(
                          width: 170,
                          height: 70,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(250, 250, 250, 0.7),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp2()));
                        },
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 25, left: 60),
                            child: Text(
                              'sign in',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          )),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
