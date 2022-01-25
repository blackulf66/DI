import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<Principal> {
  int _selectedIndex = 0;

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
          padding: const EdgeInsets.all(30),
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
              Row(
                children: const [
                  SizedBox(
                    height: 510,
                    width: 330,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                    ),
                  )
                ],
              )
            ], //columna principal
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
}
