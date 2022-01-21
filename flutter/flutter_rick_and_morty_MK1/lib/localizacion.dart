import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/rick_and_morty_locations_response.dart';


class Localizacione extends StatefulWidget {
  const Localizacione({ Key? key }) : super(key: key);

  @override
  _LocalizacionState createState() => _LocalizacionState();
}

class _LocalizacionState extends State<Localizacione>
    with SingleTickerProviderStateMixin {

  late Future<List<Localizacion>> items2;

  late AnimationController _controller;

  @override
  void initState() {
    items2 = fetchLocalizacion();
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
                  child: FutureBuilder<List<Localizacion>>(
                      future: items2,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _LocalizacionList(snapshot.data!);
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

  Future<List<Localizacion>> fetchLocalizacion() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
    if (response.statusCode == 200) {
      return LocalizacionResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('WABALABADUBDUUUB');
    }
  }
 

 // ignore: non_constant_identifier_names
 Widget _LocalizacionList(List<Localizacion> localizacionList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: localizacionList.length,
      itemBuilder: (context, index) {
        return _LocalizacionItem(localizacionList.elementAt(index), index);
      },
    );
  }

// ignore: non_constant_identifier_names
Widget _LocalizacionItem(Localizacion loca, int index) {
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  loca.name,
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

