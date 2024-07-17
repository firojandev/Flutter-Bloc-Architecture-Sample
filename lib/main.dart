import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edcr_sup_flutter/common/config/api_config.dart';
import 'package:edcr_sup_flutter/common/repo/repo.dart';
import 'package:edcr_sup_flutter/common/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

import 'common/services/service.dart';

void main() {
  runZonedGuarded(() {

    initService();
    initRepo();

    apiService.init(baseApiURL: ApiConfig.baseURL);

    Bloc.observer = TalkerBlocObserver();

    runApp(const MyApp());

  }, (error, stack) {
    debugPrint("Error $error");
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}