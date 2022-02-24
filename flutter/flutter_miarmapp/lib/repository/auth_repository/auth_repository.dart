

import 'package:flutter_miarmapp/models/auth/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
}