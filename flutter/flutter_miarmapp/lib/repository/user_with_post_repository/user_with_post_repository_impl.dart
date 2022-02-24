import 'dart:convert';

import 'package:flutter_miarmapp/constantes.dart';
import 'package:flutter_miarmapp/models/userApi_model.dart';

import 'package:http/http.dart';

import 'user_with_post_repository.dart';



class UserPostRepositoryImpl extends UserPostRepository {
  final Client _client = Client();

  @override
  Future<UserApiResponse> fetchUsers(String type) async {
    final response = await _client.get(Uri.parse('http://10.0.2.2:8080/me'),
     headers: {
       'Authorization':
            'Bearer ${Constantes.token}'});
    if (response.statusCode == 200) {
      return UserApiResponse.fromJson(json.decode(response.body)); 
    } else {
      throw Exception('Fail to load users');
    }
  }


}