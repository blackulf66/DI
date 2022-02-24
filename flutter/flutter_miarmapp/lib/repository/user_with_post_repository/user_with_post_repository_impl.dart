import 'dart:convert';

import 'package:flutter_miarmapp/models/userApi_model.dart';

import 'package:http/http.dart';

import 'user_with_post_repository.dart';



class UserPostRepositoryImpl extends UserPostRepository {
  final Client _client = Client();

/*List<PublicacionData> myModels;
var response = await http.get("myUrl");

myModels=(json.decode(response.body) as List).map((i) =>
              MyModel.fromJson(i)).toList();*/

  @override
  Future<UserApiResponse> fetchUsers(String type) async {
    final response = await _client.get(Uri.parse('http://10.0.2.2:8080/me'),
     headers: {
       'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2MzI5MTRiMS04ODI4LTQ3MWMtOGJmZS03ZTlkZDU5NTkyNjUiLCJpYXQiOjE2NDU3Nzk2OTMsIm5pY2siOiJpc3Npc2kiLCJyb2xlIjoiVVNFUiJ9.eOxStCm_--rBcaGTPEGN5mSKfse_SPm0hi9kiz-SRT0'});
    if (response.statusCode == 200) {
      return UserApiResponse.fromJson(json.decode(response.body)); 
    } else {
      throw Exception('Fail to load users');
    }
  }


}