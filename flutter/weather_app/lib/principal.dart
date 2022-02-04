import 'dart:convert';

import 'package:flutter/material.dart';

import 'constantes.dart';
import 'models/weather_model.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

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
  int _selectedIndex = 0;

  late Future<WeatherResponse> items;

   @override
  void initState() {
    items = fetchWeather();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          SizedBox(
            height: 200,
            child: FutureBuilder<WeatherResponse>(
                future: items,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
          child: Column(
        children: [
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: 120),
                child: RichText(
                  text:  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: snapshot.data!.name,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
          ),
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'julio 22 ,2022',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(50.0),
            child: SizedBox(
                width: 150,
                child: Image(image: AssetImage('assets/images/nublado.png'))),
          )),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'temperatura',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '${snapshot.data!.main.tempMax}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'humedad',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '0%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'viento',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '200km/h',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('hoy', style: TextStyle(color: Colors.white)),
                ]),)]),);

                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  {
                    return const Text("buscando");
                  }
                }),
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Style.azuliconomenu,
            ),
            label: 'Home',
            backgroundColor: Style.moradomenu,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Style.azuliconomenu,
            ),
            label: 'Business',
            backgroundColor: Style.moradomenu,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Style.azuliconomenu,
            ),
            label: 'School',
            backgroundColor: Style.moradomenu,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Style.azuliconomenu,
            ),
            label: 'Settings',
            backgroundColor: Style.moradomenu,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      backgroundColor: Style.colordefondo,
    );
  }

  Future<WeatherResponse> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=37.3875771&lon=-6.0280327&appid=e6355afab996c365828cab0806e44520&units=metric'));
    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('SILBIDOS');
    }
  }

 
  }


//f28e837e4595cfac202f03b29b52beca api key;