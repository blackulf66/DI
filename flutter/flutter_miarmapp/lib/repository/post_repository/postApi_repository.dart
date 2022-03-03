
import 'package:flutter_miarmapp/models/Post_dto.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';

abstract class PostApiRepository {
  Future<List<PostApiResponse>> fetchPosts(String type);

  Future<PostApiResponse> createPost(PostDto dto, String imagePath);
}