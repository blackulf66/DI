import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String dropdownValue = 'English';

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int buttonColor = 0xff26A9FF;

  bool inputTextNotNull = false;

  @override
  Widget build(BuildContext context) {

    double deviseWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 90,
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Container(
            width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
           
          ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  Image.asset('assets/images/logo_miarmapp.png',width: deviseWidth * .20,
                    height: deviseWidth * .20,
                    ),
                
                  SizedBox(height: deviseWidth * .05,),
                  Container(
                    width: deviseWidth * .90,
                    height: deviseWidth * .14,
                    decoration: BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: TextField(
                          onChanged: (text){
                            setState(() {
                              if(usernameController.text.length >= 2 && passwordController.text.length >= 2){
                                inputTextNotNull = true;
                              }else{
                                inputTextNotNull = false;
                              }
                            });
                          },
                          controller: usernameController,
                          style: TextStyle(
                            fontSize: deviseWidth * .040,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'numero de telefono , email o nombre de usuario',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: deviseWidth * .04,),
                  Container(
                    width: deviseWidth * .90,
                    height: deviseWidth * .14,
                    decoration: BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: TextField(
                          onChanged: (text){
                            setState(() {
                              if(usernameController.text.length >= 2 && passwordController.text.length >= 2){
                                inputTextNotNull = true;
                              }else{
                                inputTextNotNull = false;
                              }
                            });
                          },
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: deviseWidth * .040,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'contrase??a',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: deviseWidth * .04,),
                  inputTextNotNull?
                  GestureDetector(
                    onLongPressStart: (s){
                      setState(() {
                        buttonColor = 0xff78C9FF;
                      });
                    },
                    onLongPressEnd: (s){
                      setState(() {
                        buttonColor = 0xff26A9FF;
                      });
                    },
                    onTap: (){
                      print('Log In');
                    },

                    child: Container(
                      width: deviseWidth * .90,
                      height: deviseWidth * .14,
                      decoration: BoxDecoration(
                        color: Color(buttonColor),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: deviseWidth * .040,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ):
                  InkWell(
                    child: Container(
                      width: deviseWidth * .90,
                      height: deviseWidth * .14,
                      decoration: BoxDecoration(
                        color: Color(0xff78C9FF),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: deviseWidth * .040,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  SizedBox(height: deviseWidth * .035,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('olvidaste tus datos de login? ',
                      style: TextStyle(
                        fontSize: deviseWidth * .035,
                      ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print('ayudame');
                        },
                        child: Text('ayudame',
                        style: TextStyle(
                          fontSize: deviseWidth * .035,
                          color: Color(0xff002588),
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviseWidth * .040,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: deviseWidth * .40,
                        color: Color(0xffA2A2A2),
                      ),
                      SizedBox(width: 10,),
                      Text('O',
                      style: TextStyle(
                        fontSize: deviseWidth * .040,
                      ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 1,
                        width: deviseWidth * .40,
                        color: Color(0xffA2A2A2),
                      ),
                    ],
                  ),
                  SizedBox(height: deviseWidth * .06,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/facebook.png',
                      height: deviseWidth * .060,
                      ),
                      SizedBox(width: 5,),
                      Text('Login with facebook',
                      style: TextStyle(
                        color: Color(0xff1877f2),
                        fontSize: deviseWidth * .040,
                        fontWeight: FontWeight.w800,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
                Container(
                  width: deviseWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: deviseWidth,
                        height: 1,
                        color: Color(0xffA2A2A2),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",
                          style: TextStyle(
                            fontSize: deviseWidth * .040,
                          ),
                          ),
                          GestureDetector(
                            onTap: (){
                              print('Sing up');
                            },
                            child: Text('Sing up',
                            style: TextStyle(
                              color: Color(0xff00258B),
                              fontSize: deviseWidth * .040,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}