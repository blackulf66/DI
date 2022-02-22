
import 'package:flutter_miarmapp/models/postApi_model.dart';

abstract class PostApiRepository {
  Future<List<PostApiResponse>> fetchPosts();
}