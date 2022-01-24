import 'package:flutter/material.dart';
import 'package:flutter_navigation_routes/pages/pantalla3.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  static const String _title = 'el titulo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(title: const Text(_title), backgroundColor: Colors.red,),
          body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Hello Again!',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(20),
                      child: const SizedBox(
                        width: 300,
                        child: Text(
                          'wellcome back you`ve been missed',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'nombre de usuario',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                        alignment: Alignment.topRight,
                        child: const Text('recovery password',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('sign in'),
                          onPressed: (
                            
                          ) {},
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '---or continue with---',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20 , left: 20),
                          child: SizedBox(
                            width: 50,
                            child: Container(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: SignInButton(
                                Buttons.Google,
                                text: '',
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20 , left: 20),
                          child: SizedBox(
                            width: 50,
                            child: Container(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: SignInButton(
                                Buttons.Facebook,
                                text: '',
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20 , left: 20),
                          child: SizedBox(
                            width: 50,
                            child: Container(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: SignInButton(
                                Buttons.Apple,
                                text: '',
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: <Widget>[
                        const Text('no tienes cuenta?'),
                        TextButton(
                          child: const Text(
                            'Registrese',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp3()));
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ))),
    );
  }
}
