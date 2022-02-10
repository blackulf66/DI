import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/horas_model.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/preference.dart';

import '../models/weather_model.dart';

import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class PaginaTiempo extends StatefulWidget {
  const PaginaTiempo({Key? key}) : super(key: key);

  @override
  State<PaginaTiempo> createState() => _PaginaTiempo();
}

class _PaginaTiempo extends State<PaginaTiempo> {
  int _selectedIndex = 0;

  late Future<WeatherResponse> items;

  late Future<List<Hourly>> items2;

  late Future<List<Daily>> items3;

  double latSeleccionada = 37.3754338;

  double longSeleccionada = -5.9900776;

  String convertedDateTime =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";


@override
  void initState() {
    items = fetchWeather();
    items2 = fetchHoras();
    items3 = fetchDias();
    PreferenceUtils.init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<WeatherResponse>(
            future: items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: RichText(
                              text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: snapshot.data!.name,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: '  ${snapshot.data!.main.temp.toInt()}'
                                    ' º',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        ),
                      ],
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
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                            width: 130,
                            child: InkWell(
                              child: Image.asset(
                                  'assets/images/icons/${snapshot.data!.weather[0].icon}.png'),
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                            )),
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
                                        text: 's.Termica',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data!.main.feelsLike.toInt()} º ',
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
                          const EdgeInsets.only(top: 90, left: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Hoy', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 170,
                          child: FutureBuilder<List<Hourly>>(
                              future: items2,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _ListOfWeatherhourly(
                                      snapshot.data!, context);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                {
                                  return const Padding(
                                    padding: EdgeInsets.only(top: 100),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 90, left: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Esta semana',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 170,
                          child: FutureBuilder<List<Daily>>(
                              future: items3,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _ListOfWeatherdaily(
                                      snapshot.data!, context);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }

                                return const Padding(
                                  padding: EdgeInsets.only(top: 100),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
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
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
      );
  }
  Widget _ListOfWeatherhourly(List<Hourly> List, BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: List.length,
      itemBuilder: (context, index) {
        return _Item(List.elementAt(index), index);
      },
    ),
  );
}

// ignore: non_constant_identifier_names
Widget _ListOfWeatherdaily(List<Daily> List2, BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: List2.length,
      itemBuilder: (context, index) {
        print(index);
        return _Item2(List2.elementAt(index));
      },
    ),
  );
}

// ignore: non_constant_identifier_names
Widget _Item(Hourly loca, int index) {
  var date = DateTime.fromMillisecondsSinceEpoch(loca.dt * 1000);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 20,
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.purple.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: Image.asset(
                    'assets/images/icons/${loca.weather[0].icon}.png',
                    width: 77),
              ),
              SizedBox(
                width: 120,
                child: Text(loca.temp.toInt().toString() + " º",
                    style: const TextStyle(color: Colors.white)),
              ),
              SizedBox(
                width: 120,
                child: Text(
                    date.hour.toString() +
                        ':' +
                        date.minute.toString() +
                        '0:' +
                        date.second.toString() +
                        '0',
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget _Item2(Daily loca) {
  var date = (DateTime.fromMillisecondsSinceEpoch(loca.dt * 1000));
  initializeDateFormatting();
  var week = DateFormat('EEEE', 'es_ES').format(date);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 20,
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.purple.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: Image.asset(
                    'assets/images/icons/${loca.weather[0].icon}.png',
                    width: 77),
              ),
              SizedBox(
                width: 120,
                child: Text(loca.temp.day.toInt().toString() + " º",
                    style: const TextStyle(color: Colors.white)),
              ),
              SizedBox(
                width: 120,
                child: Text(week, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}




Future<WeatherResponse> fetchWeather() async {

    var lat = PreferenceUtils.getDouble('lat');
    var long = PreferenceUtils.getDouble('lng');

    latSeleccionada = lat!;
    longSeleccionada = long!;

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latSeleccionada&lon=$longSeleccionada&appid=e6355afab996c365828cab0806e44520&units=metric'));
    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('777');
    }
  }

  Future<List<Hourly>> fetchHoras() async {
    var lat = PreferenceUtils.getDouble('lat');
    var long = PreferenceUtils.getDouble('lng');

    latSeleccionada = lat!;
    longSeleccionada = long!;

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latSeleccionada&lon=$longSeleccionada&exclude={part}&appid=f28e837e4595cfac202f03b29b52beca&units=metric'));
    if (response.statusCode == 200) {
      return HorasResponse.fromJson(jsonDecode(response.body)).hourly;
    } else {
      throw Exception('777');
    }
  }


Future<List<Daily>> fetchDias() async {

    var lat = PreferenceUtils.getDouble('lat');
    var long = PreferenceUtils.getDouble('lng');

    latSeleccionada = lat!;
    longSeleccionada = long!;

  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$latSeleccionada&lon=$longSeleccionada&exclude=minutely&appid=f28e837e4595cfac202f03b29b52beca&units=metric'));
  if (response.statusCode == 200) {
    return HorasResponse.fromJson(jsonDecode(response.body)).daily;
  } else {
    throw Exception('777');
  }
}
}