import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tmdb/model/peliculas_model.dart';
import 'package:http/http.dart' as http;


class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<Principal> {
  int _selectedIndex = 0;

  late Future<List<PopularMovies>> items;

 @override
  void initState() {
    items = fetchPopularMovies();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const String _title = 'el titulo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top:30),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://googleflutter.com/sample_image.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Black ULf'),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 24.0,
                        semanticLabel: 'ª',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 300,
                        child: RichText(
                          text: const TextSpan(
                            text: 'MOVIE , SERIES, TV SHOWS... ',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(children: [
                   Text('Newest' ,style: TextStyle(fontSize: 16)),
                ],),
                   Row(
                    children:  [
                       SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: FutureBuilder<List<PopularMovies>>(
                              future: items,
                              builder: (context, snapshot) {  
                                if (snapshot.hasData) {
                                  return _PopularMoviesList(snapshot.data!);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                {
                                  return const Text("buscando");
                                }
                              }),
                        ),
                    ],
        
                )
              ], //columna principal
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.star , color: Colors.black,),
              label: 'Trending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back, color: Colors.black),
              label: 'Films',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people, color: Colors.black),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box, color: Colors.black),
              label: 'otro',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
  Future<List<PopularMovies>> fetchPopularMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=7795a871a20c3e90e4ed5c2726f51dae&language=en-US&page=1'));
    if (response.statusCode == 200) {
      return PopularMoviesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load PopularMovies');
    }
  }

   Widget _PopularMoviesList(List<PopularMovies> pm) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: pm.length,
      itemBuilder: (context, index) {
        return _PopularMovieItem(pm.elementAt(index));
      },
    );
  }

  Widget _PopularMovieItem(PopularMovies pm) {
    return Card(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.purple.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped');
        },
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            color: const Color.fromRGBO(1, 1, 1, 0),
            
              child: SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        pm.originalTitle,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.white),
                      ),
                    ),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


