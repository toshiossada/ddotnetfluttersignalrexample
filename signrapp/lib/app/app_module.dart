import 'package:dio/dio.dart';
import 'package:signrapp/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:signrapp/app/app_widget.dart';
import 'package:signrapp/app/modules/home/home_module.dart';
import 'package:signrapp/app/shared/custom_dio/custom_dio.dart';

import 'shared/utils/settings.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: "https://10.0.2.2:5001/chatHub"))),
        Bind((i) => CustomDio(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
