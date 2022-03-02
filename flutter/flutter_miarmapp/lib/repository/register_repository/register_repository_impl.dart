
import 'dart:convert';

import 'package:flutter_miarmapp/models/auth/register_dto.dart';
import 'package:flutter_miarmapp/models/auth/register_response.dart';
import 'package:http/http.dart';

import 'package:flutter_miarmapp/repository/register_repository/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final Client _client = Client();

  @override
  Future<RegisterResponse> register(RegisterDto registerDto) async {


    final response = await _client.post(
        Uri.parse('http://10.0.2.2:8080/auth/register'),
        body: jsonEncode(registerDto.toJson()));
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('error al registrarse ');
    }
  }
}
