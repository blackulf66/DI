import 'dart:convert';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/repository/postApi_repository.dart';
import 'package:http/http.dart';

class PostApiRepositoryImpl extends PostApiRepository {
  final Client _client = Client();

@override
  Future<List<PostApiResponse>> fetchPosts() async {
    final response = await _client.get(Uri.parse('http://10.0.2.2:8080/post/public'),headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzMmVhYzYwZS1mNTExLTRmMmMtYTJlMi0xYjM5MDVjZmYzZWMiLCJpYXQiOjE2NDU3MDA5NjYsIm5pY2siOiJpc3Npc2kiLCJyb2xlIjoiVVNFUiJ9.FV7ftd4MdGEeSsZVaBCIRWoBvB9DbPgfGbeBBD_46HY',
    },);
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((i) =>
              PostApiResponse.fromJson(i)).toList();
    } else {
      throw Exception('Fail to load post');
    }
  }

}