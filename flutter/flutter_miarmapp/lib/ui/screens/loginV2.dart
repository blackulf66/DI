import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_miarmapp/models/auth/login_response.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/ui/screens/home_screen.dart';
import 'package:flutter_miarmapp/ui/screens/menu_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthRepository authRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return LoginBloc(authRepository);
        },
        child: _createBody(context));
  }

  _createBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<LoginBloc, LoginState>(
                listenWhen: (context, state) {
              return state is LoginSuccessState || state is LoginErrorState;
            }, listener: (context, state) async {
              if (state is LoginSuccessState) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('token', state.loginResponse.token);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              } else if (state is LoginErrorState) {
                _showSnackbar(context, state.message);
              }
            }, buildWhen: (context, state) {
              return state is LoginInitialState || state is LoginLoadingState;
            }, builder: (ctx, state) {
              if (state is LoginInitialState) {
                return buildForm(ctx);
              } else if (state is LoginLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return buildForm(ctx);
              }
            })),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  suffixIconColor: Colors.white,
                  hintText: 'Email',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value == null || !value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.vpn_key),
                  suffixIconColor: Colors.white,
                  hintText: 'Password',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              onSaved: (String? value) {
              },
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Write a password'
                    : null;
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final loginDto = LoginDto(
                    email: emailController.text,
                    password: passwordController.text);
                BlocProvider.of<LoginBloc>(context).add(DoLoginEvent(loginDto));
              }
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'Sign In'.toUpperCase(),
                  style: const TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
