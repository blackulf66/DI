import 'package:flutter/material.dart';

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
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'shubidubidurudashubidubidu'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Card(
                shadowColor: Colors.purple,
                elevation: 10,
                child: InkWell(
                  splashColor: Colors.purple.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped');
                  },
                  child: SizedBox(
                    width: 350,
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 15),
                              child: RichText(
                                  text: const TextSpan(
                                      text: '20:55\n',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                    TextSpan(
                                        text: 'SALIDA',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10))
                                  ])),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 90, left: 10),
                              child: RichText(
                                  text: const TextSpan(
                                      text: '22:05\n',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      children: [
                                    TextSpan(
                                        text: 'LLEGADA',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10))
                                  ])),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 130),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: RichText(
                                        text: const TextSpan(
                                            text: 'MAD',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))),
                                  ),
                                  RichText(
                                      text: const TextSpan(
                                          text: 'Madrid',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18)))
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 130),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/iberia.png',
                                          width: 60,
                                        ),
                                        RichText(
                                            text: const TextSpan(
                                          text: 'Iberia 7448',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                      ],
                                    ),
                                    RichText(
                                        text: const TextSpan(
                                            text: 'Duración 2h 10m',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)))
                                  ],
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 130),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(2)),
                                    child: RichText(
                                        text: const TextSpan(
                                            text: 'LHR',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))),
                                  ),
                                  RichText(
                                      text: const TextSpan(
                                          text: 'Londres',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18)))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Card(
                  shadowColor: Colors.purple,
                  elevation: 10,
                  child: InkWell(
                    splashColor: Colors.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(10),

                    child: SizedBox(
                      width: 330,
                      height: 330,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'El más barato, Buena puntuación',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 13),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: RichText(
                                  text: const TextSpan(
                                    text: '45 ofertas',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/rayo.png',
                                      width: 200,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Rayo',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: RichText(
                                  text: const TextSpan(
                                    text:
                                        'sin puertas . es Rayo, chachauuu funciona con alinol',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 10, top: 5),
                                  child: Icon(
                                    Icons.remove_done,
                                    color: Colors.black,
                                    size: 15.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 10),
                                  child: RichText(
                                    text: const TextSpan(
                                      text: 'Man.',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 10, top: 5, left: 5),
                                  child: Icon(
                                    Icons.ac_unit,
                                    color: Colors.black,
                                    size: 15.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 10, left: 5),
                                  child: RichText(
                                    text: const TextSpan(
                                      text: 'A/A.',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 10, top: 5, left: 5),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 15.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 10, left: 5),
                                  child: RichText(
                                    text: const TextSpan(
                                      text: '0',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 10, top: 5, left: 5),
                                  child: Icon(
                                    Icons.hot_tub,
                                    color: Colors.black,
                                    size: 15.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 10, left: 5),
                                  child: RichText(
                                    text: const TextSpan(
                                      text: '9',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                          const Divider(
                              height: 25,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                          Row(
                            children: [
                               RichText(
                                  text: const TextSpan(
                                      text: '35 €',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18)),
                                ),  
                              Padding(
                                padding: const EdgeInsets.only(left: 194),
                                child: RichText(
                                  text: const TextSpan(
                                      text: 'LOCALIZAR',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(230, 230, 230, 1));
  }
}
