import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/image_pick_bloc/image_pick_bloc_bloc.dart';
import 'package:flutter_miarmapp/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_miarmapp/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_miarmapp/models/auth/register_dto.dart';
import 'package:flutter_miarmapp/models/auth/register_response.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository_impl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:date_field/date_field.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_screen.dart';

class RegisterScreenV2 extends StatefulWidget {
  const RegisterScreenV2({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreenV2> {
  String imageSelect = "Imagen no selecionada";
  FilePickerResult? result;
  PlatformFile? file;
  final _imagePicker = ImagePicker();
  bool _passwordVisible = false;


  String date = "";
  DateTime selectedDate = DateTime.now();

  late AuthRepository authRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nick = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fechaNacimiento = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController perfilPrivador = TextEditingController();

  late Future<SharedPreferences> _prefs;
  final String uploadUrl = 'http://10.0.2.2:8080/auth/register';
  String path = "";

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _prefs = SharedPreferences.getInstance();
    _passwordVisible = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return ImagePickBlocBloc();
            },
          ),
          BlocProvider(
            create: (context) {
              return RegisterBloc(authRepository);
            },
          ),
        ],
        child: _createBody(context),
      ),
    );
  }

  _createBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<RegisterBloc, RegisterState>(
                listenWhen: (context, state) {
              return state is RegisterSuccessState || state is LoginErrorState;
            }, listener: (context, state) async {
              if (state is RegisterSuccessState) {
                _loginSuccess(context, state.registerResponse);
              } else if (state is LoginErrorState) {
                _showSnackbar(context, "error");
              }
            }, buildWhen: (context, state) {
              return state is RegisterInitialState ||
                  state is RegisterLoadingState;
            }, builder: (ctx, state) {
              if (state is RegisterInitialState) {
                return _register(ctx);
              } else if (state is RegisterLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _register(ctx);
              }
            })),
      ),
    );
  }

  Future<void> _loginSuccess(
      BuildContext context, RegisterResponse late) async {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString('token', late.email);
      prefs.setString('id', late.id);
      prefs.setString('avatar', late.avatar);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuScreen()),
      );
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _register(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                        'Reg??strate para ver fotos y v??deos de tus amigos',
                        style: TextStyle(color: Colors.grey, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Divider(
                      color: Colors.black,
                      height: 20,
                    ),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            controller: nick,
                            decoration: InputDecoration(
                              hintText: 'Nick',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      
                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            ),
                            child: DateTimeFormField(
                              initialDate: DateTime(2001, 9, 7),
                              firstDate: DateTime.utc(1900),
                              lastDate: DateTime.now(),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                suffixIcon: Icon(Icons.calendar_today),
                                labelText: 'cuando naciste?',
                              ),
                              mode: DateTimeFieldPickerMode.date,
                              autovalidateMode: AutovalidateMode.always,
                              validator: (e) => (e?.day ?? 0) == 1
                                  ? 'Please not the first day'
                                  : null,
                              onDateSelected: (DateTime value) {
                                selectedDate = value;
                                print(value);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                           border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                     Column(
                      children: [
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                             border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey  ,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      
                      ],
                    ),
                    
                    SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<ImagePickBlocBloc, ImagePickBlocState>(
                        listenWhen: (context, state) {
                          return state is ImageSelectedSuccessState;
                        },
                        listener: (context, state) {},
                        buildWhen: (context, state) {
                          return state is ImagePickBlocInitial ||
                              state is ImageSelectedSuccessState;
                        },
                        builder: (context, state) {
                          if (state is ImageSelectedSuccessState) {
                            path = state.pickedFile.path;
                            print('PATH ${state.pickedFile.path}');
                            return Column(children: [
                              Image.file(
                                File(state.pickedFile.path),
                                height: 100,
                              ),
                             
                            ]);
                          }
                          return Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<ImagePickBlocBloc>(context)
                                        .add(const SelectImageEvent(
                                            ImageSource.gallery));
                                  },
                                  child: const Text('Select Image')));
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(240, 50), primary: Colors.blue),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (_formKey.currentState!.validate()) {
                      final loginDto = RegisterDto(
                          nick: nick.text,
                          email: emailController.text,
                          password: passwordController.text,
                          perfilProvado: 'False');

                      BlocProvider.of<RegisterBloc>(context)
                          .add(DoRegisterEvent(loginDto, path));
                    }
                    prefs.setString('nick', nick.text);
                    prefs.setString('email', emailController.text);
                    prefs.setString('fechaNacimiento',
                        DateFormat("yyyy-MM-dd").format(selectedDate));
                    prefs.setString('password', passwordController.text);
                    prefs.setString('perfilProvado', perfilPrivador.text);

                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Register'),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
