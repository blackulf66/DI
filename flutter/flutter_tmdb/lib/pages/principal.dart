import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  static const String _title = 'el titulo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
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
                    padding: const EdgeInsets.only(left: 200),
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
                  RichText(
                    text: TextSpan(
                      text: 'MOVIE , SERIES, TV SHOWS... ',
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                ],
              ),
            ], //columna principal
          ),
        ),
      ),
    );
  }
}
