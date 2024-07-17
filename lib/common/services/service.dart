import 'package:edcr_sup_flutter/common/services/api_service.dart';
import 'package:edcr_sup_flutter/common/services/api_service_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initService() {
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl());
}

ApiService get apiService => getIt.get<ApiService>();
