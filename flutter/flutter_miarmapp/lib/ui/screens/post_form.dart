import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/image_pick_bloc/image_pick_bloc_bloc.dart';
import 'package:flutter_miarmapp/bloc/post_bloc/post_bloc.dart';
import 'package:flutter_miarmapp/models/Post_dto.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository_impl.dart';
import 'package:flutter_miarmapp/repository/post_repository/postApi_repository.dart';
import 'package:flutter_miarmapp/repository/post_repository/postApi_repository_impl.dart';
import 'package:flutter_miarmapp/ui/screens/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:date_field/date_field.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_screen.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  _postformScreenState createState() => _postformScreenState();
}

class _postformScreenState extends State<PostForm> {
  String imageSelect = "no tienes imagen ";
  FilePickerResult? result;
  PlatformFile? file;
  final _imagePicker = ImagePicker();

  String date = "";
  DateTime selectedDate = DateTime.now();

  late PostApiRepository _postRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController titulo = TextEditingController();
  TextEditingController texto = TextEditingController();
  TextEditingController postEnum = TextEditingController();
  late Future<SharedPreferences> _prefs;
  final String uploadUrl = 'http://10.0.2.2:8080/auth/register';
  String path = "";
  bool _passwordVisible = false;
  bool _isPublic= true;

  @override
  void initState() {
    _postRepository = PostApiRepositoryImpl();
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
              return PostBloc(_postRepository);
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
            child: BlocConsumer<PostBloc, BlocPostState>(
                listenWhen: (context, state) {
              return state is PostSuccessState || state is PostErrorState;
            }, listener: (context, state) async {
              if (state is PostSuccessState) {
                _loginSuccess(context, state.loginResponse);
              } else if (state is PostErrorState) {
                _showSnackbar(context, state.message);
              }
            }, buildWhen: (context, state) {
              return state is BlocPostInitial || state is PostLoading;
            }, builder: (ctx, state) {
              if (state is BlocPostInitial) {
                return _post(ctx);
              } else if (state is PostLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _post(ctx);
              }
            })),
      ),
    );
  }

  Future<void> _loginSuccess(
      BuildContext context, PostApiResponse late) async {
    _prefs.then((SharedPreferences prefs) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _post(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'nueva publicacion:',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
         
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
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
                          
                          controller: titulo,
                          decoration: InputDecoration(
                            hintText: 'Titulo',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                     
                      Padding(
                padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
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
                            controller: texto,
                            decoration: InputDecoration(
                              hintText: 'Texto',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                       Column(
                        children: [
                          Checkbox(
                            value: _isPublic,
                            onChanged: (value) {
                              setState(() {
                                _isPublic = value!;
                              });
                            }),
                        const Text('marca si quieres que tu post sea publico'),
                        ],
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
                                    child: const Text('Seleccionar Imagen')));
                          })
                    ],
                  ),
                ),
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
                      final loginDto = PostDto(
                          titulo: titulo.text,
                          texto: texto.text,
                          postEnum: _isPublic);
                      BlocProvider.of<PostBloc>(context)
                          .add(DoPostEvent(loginDto, path));
                    }
                    prefs.setString('titulo', titulo.text);
                    prefs.setString('texto', texto.text);
                    prefs.setBool('postEnum', _isPublic);
                  },
                  child: const Text('subir'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
