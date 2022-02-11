import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/models/horas_model.dart';
import 'package:weather_app/pages/pagina_Tiempo.dart';
import 'package:weather_app/pages/pantallaSeleccionMapa.dart';
import 'package:weather_app/preference.dart';

import 'constantes.dart'  as util;
import 'models/weather_model.dart';

import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  late Future<WeatherResponse> items;

  late Future<List<Hourly>> items2;

  late Future<List<Daily>> items3;
  
  final myController = TextEditingController();


  String convertedDateTime =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[

    MapClickPage(),

    PaginaTiempo(),

    
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: util.Style.moradomenu,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {},
                    ),
                    hintText: 'buscar...',
                    border: InputBorder.none),
              ),
            ),
          )),
          
      body:Stack(
  children: <Widget>[

    Container(
  decoration:  BoxDecoration(
    gradient:  LinearGradient(
      begin: Alignment.topCenter,
      end: const Alignment(0.0, 1.0), 
      colors: <Color>[
        util.Style.colordefondo,
        Colors.black,
      ], 
      tileMode: TileMode.repeated, 
    ),
  ),
),
     Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    
  ],
),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: util.Style.azuliconomenu,
            ),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: util.Style.azuliconomenu,
            ),
            label: 'Tiempo',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: util.Style.moradomenu,
        
      ),
      
      backgroundColor: util.Style.colordefondo,
    );
  }
}
//f28e837e4595cfac202f03b29b52beca api key;

Future<Map> getweather(String myController) async {
  myController = myController;
    var apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=${myController.toString()}&appid=f28e837e4595cfac202f03b29b52beca&units=metric';

    http.Response response = await http.get(Uri.parse(apiUrl));
    return json.decode(response.body);
  }



