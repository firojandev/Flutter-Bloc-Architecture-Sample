import 'package:edcr_sup_flutter/features/auth/data/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> postLogin({String? userId, String? password, String? token});
}
