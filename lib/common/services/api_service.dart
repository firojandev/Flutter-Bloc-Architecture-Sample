import '../../features/auth/data/user_model.dart';

abstract class ApiService {
  void init({required String baseApiURL});

  Future<UserModel> get({required String path, Map<String, dynamic>? query});
}
