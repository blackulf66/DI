import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/rick_and_morty_character_response.dart';


// ignore: camel_case_types
class personajes extends StatefulWidget {
  const personajes({ Key? key }) : super(key: key);

  @override
  _personajesState createState() => _personajesState();
}

// ignore: camel_case_types
class _personajesState extends State<personajes>
    with SingleTickerProviderStateMixin {

      
  late Future<List<Personajes>> items;

  late AnimationController _controller;

  @override
  void initState() {
    items = fetchPersonajes();
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  child: FutureBuilder<List<Personajes>>(
                      future: items,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _PersonajeList(snapshot.data!);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        {
                          return const Text("WABALABADUBDUUUUB");
                        }
                      }),
                ),

              ],
            ),
          );
    }
  }

  Future<List<Personajes>> fetchPersonajes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      return CharacterResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('WABALABADUBDUUUB');
    }
  }

  // ignore: non_constant_identifier_names
  Widget _PersonajeList(List<Personajes> personajesList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: personajesList.length,
      itemBuilder: (context, index) {
        return _PersonajeItem(personajesList.elementAt(index), index);
      },
    );
  }


// ignore: non_constant_identifier_names
Widget _PersonajeItem(Personajes characters, int index) {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Container(
      color: const Color.fromRGBO(1, 1, 1, 1),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Image.network(
                characters.image,
                width: 120  ,
              ),
              Padding(
                padding: const EdgeInsets.all(10),  
                child: Text(
                  characters.name,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
