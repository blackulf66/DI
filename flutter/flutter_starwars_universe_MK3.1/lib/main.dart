import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starwars_universe/models/starwars_planets_response.dart';

import 'models/starwars_People_response.dart';

import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'STAR WARS UNIVERSE'),
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
  late Future<List<People>> items;

  late Future<List<Planets>> items2;

  @override
  void initState() {
    items = fetchPeople();
    items2 = fetchPlanets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/galaxy.gif"),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Container(
            color: const Color.fromRGBO(1, 1, 1, 0.6),
            child: const Text(
              "GUARDIANS OF THE GALAXY",
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
          ),
        ),
      ]),
      drawer: Drawer(
        backgroundColor: Colors.red,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                "MENU",
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Personajes'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: Text(widget.title),
                            ),
                            body: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/galaxy.gif"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Personajes",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: FutureBuilder<List<People>>(
                                            future: items,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return _peopleList(
                                                    snapshot.data!);
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    '${snapshot.error}');
                                              }
                                              {
                                                return const Text("buscando");
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))));
              },
            ),
            ListTile(
              title: const Text('Planetas'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: Text(widget.title),
                              ),
                              body: Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/galaxy.gif"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 80),
                                          child: Text(
                                            "Planetas",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200,
                                          child: FutureBuilder<List<Planets>>(
                                              future: items2,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return _planetsList(
                                                      snapshot.data!);
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      '${snapshot.error}');
                                                }
                                                {
                                                  return const Text("buscando");
                                                }
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<People>> fetchPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      return StarResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load people');
    }
  }

  Future<List<Planets>> fetchPlanets() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/planets'));
    if (response.statusCode == 200) {
      return PlanetsResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load planets');
    }
  }

  Widget _peopleList(List<People> peopleList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: peopleList.length,
      itemBuilder: (context, index) {
        return _peopleItem(peopleList.elementAt(index), index);
      },
    );
  }

  Widget _planetsList(List<Planets> planetsList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: planetsList.length,
      itemBuilder: (context, index) {
        return _planetsItem(planetsList.elementAt(index), index);
      },
    );
  }

  Widget _planetsItem(Planets planets, int index) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.red,
      elevation: 200,
      child: InkWell(
        splashColor: Colors.purple.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped');
        },
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Container(
            color: const Color.fromRGBO(1, 1, 1, 0),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        planets.name,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.white),
                      ),
                    ),
                    Image.network(
                      'https://starwars-visualguide.com/assets/img/planets/${index + 1}.jpg',
                      width: 120,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _peopleItem(People people, int index) {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Container(
      color: const Color.fromRGBO(1, 1, 1, 0),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  people.name,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                ),
              ),
              Image.network(
                "https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg",
                width: 90,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
