import 'package:dio/dio.dart';
import 'package:edcr_sup_flutter/common/services/api_service.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../features/auth/data/user_model.dart';

class ApiServiceImpl extends ApiService {

  late Dio _dio;

  @override
  Future<UserModel> get({required String path, Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return UserModel.fromJson(
        response.data,
      );
    } on DioException catch (e) {
      return UserModel.error(e.toString(),"0");
    }catch (e) {
      return UserModel.error(e.toString(),"0");
    }
  }

  @override
  void init({required String baseApiURL}) {
    _dio = Dio(BaseOptions(baseUrl: baseApiURL,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    ),);

    _dio.interceptors.add(TalkerDioLogger(settings: const TalkerDioLoggerSettings(
      printResponseHeaders: true,
      printResponseMessage: true,
    )));
  }

}