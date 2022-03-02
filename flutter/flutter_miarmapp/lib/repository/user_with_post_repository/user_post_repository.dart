
import 'package:flutter_miarmapp/models/userApi_model.dart';

abstract class UserPostRepository {
  Future<UserApiResponse> fetchUsers(String type);
}