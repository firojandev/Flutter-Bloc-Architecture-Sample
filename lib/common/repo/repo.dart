import 'package:edcr_sup_flutter/features/auth/data/login_repository.dart';
import 'package:edcr_sup_flutter/features/auth/data/login_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initRepo() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
}

LoginRepository get loginRepository => getIt.get<LoginRepository>();
