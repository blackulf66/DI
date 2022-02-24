import 'dart:convert';
import 'package:flutter_miarmapp/constantes.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/repository/post_repository/postApi_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostApiRepositoryImpl extends PostApiRepository {
  final Client _client = Client();

@override
  Future<List<PostApiResponse>> fetchPosts() async {
   /*SharedPreferences prefs = await SharedPreferences.getInstance();*/
                
    final response = await _client.get(Uri.parse('http://10.0.2.2:8080/post/public'),headers: {
        'Authorization':
            'Bearer ${Constantes.token}',
              /*'Bearer ${prefs.getString('token')}',*/
    },);
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((i) =>
              PostApiResponse.fromJson(i)).toList();
    } else {
      throw Exception('Fail to load post');
    }
  }

}