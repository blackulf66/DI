import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/models/horas_model.dart';

import 'constantes.dart';
import 'models/weather_model.dart';

import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

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

  late Future<List<Hourly>> items2;

  String convertedDateTime =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";

  @override
  void initState() {
    items = fetchWeather();
    items2 = fetchHoras();
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
      body: SizedBox(
        child: FutureBuilder<WeatherResponse>(
            future: items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: snapshot.data!.name,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        '  ${snapshot.data!.main.temp.toInt()}'
                                        ' º',
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: convertedDateTime,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: SizedBox(
                            width: 130,
                            child:
                                Image.network(snapshot.data!.weather[0].icon)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: RichText(
                                  text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Precipitaciones',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${snapshot.data!.main.feelsLike}'
                                            '%',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
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
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              '${snapshot.data!.main.humidity}' +
                                                  ' %',
                                          style: const TextStyle(
                                              fontSize: 17,
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
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '${snapshot.data!.wind.speed}'
                                              ' km/h',
                                          style: const TextStyle(
                                              fontSize: 17,
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('hoy', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 500,
                          child: FutureBuilder<List<Hourly>>(
                              future: items2,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _ListOfWeather(snapshot.data!);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                {
                                  return const Text("sisiissisis");
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                );
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
        'https://api.openweathermap.org/data/2.5/weather?lat=37.3754338&lon=-5.9900776&appid=e6355afab996c365828cab0806e44520&units=metric'));
    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('777');
    }
  }

  Future<List<Hourly>> fetchHoras() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=37.3754338&lon=-5.9900776&exclude={part}&appid=f28e837e4595cfac202f03b29b52beca'));
    if (response.statusCode == 200) {
      return HorasResponse.fromJson(jsonDecode(response.body)).hourly;
    } else {
      throw Exception('777');
    }
  }
}

// ignore: non_constant_identifier_names
Widget _ListOfWeather(List<Hourly> List) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: List.length,
    itemBuilder: (context, index) {
      return _Item(List.elementAt(index), index);
    },
  );
}

// ignore: non_constant_identifier_names
Widget _Item(Hourly loca, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shadowColor: Colors.black,
      elevation: 200,
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.purple.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: const SizedBox(
          width: 100,
          height: 130,
          child: Text('A card that can be tapped',
              style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );
}

//f28e837e4595cfac202f03b29b52beca api key;
