import 'package:edcr_sup_flutter/common/services/service.dart';
import 'package:edcr_sup_flutter/common/utils/exceptions.dart';
import 'package:edcr_sup_flutter/features/auth/data/login_repository.dart';
import 'package:edcr_sup_flutter/features/auth/data/user_model.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<UserModel> postLogin(
      {String? userId, String? password, String? token}) async {
    try {
      const String url = "login";

      final response = await apiService.get(path: url, query: {
        'UserID': userId,
        'Password': password,
        'Token': token,
      });
      return response;
    } catch (e) {
      throw RepoException(e.toString());
    }
  }
}
