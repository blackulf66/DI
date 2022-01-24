import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/rick_and_morty_episodes_response.dart';



// ignore: camel_case_types
class episodes extends StatefulWidget {
  const episodes({ Key? key }) : super(key: key);

  @override
  _episodeState createState() => _episodeState();
}

// ignore: camel_case_types
class _episodeState extends State<episodes>
    with SingleTickerProviderStateMixin {

      
  late Future<List<Episodios>> items3;

  late AnimationController _controller;

  @override
  void initState() {
    items3 = fetchEpisodios();
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
                  "episodios",
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 500,
                  child: FutureBuilder<List<Episodios>>(
                      future: items3,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _EpisodiosList(snapshot.data!);
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

  Future<List<Episodios>> fetchEpisodios() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));
    if (response.statusCode == 200) {
      return EpisodesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('WABALABADUBDUUUB');
    }
  }

  // ignore: non_constant_identifier_names
  Widget _EpisodiosList(List<Episodios> personajesList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: personajesList.length,
      itemBuilder: (context, index) {
        return _EpisodiosItem(personajesList.elementAt(index), index);
      },
    );
  }


// ignore: non_constant_identifier_names
Widget _EpisodiosItem(Episodios characters, int index) {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Container(
      color: const Color.fromRGBO(1, 1, 1, 0.5),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Text(
                characters.episode,
                 style: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),  
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
