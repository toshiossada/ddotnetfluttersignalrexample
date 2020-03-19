import 'package:dio/dio.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options = BaseOptions();

    client.options.connectTimeout = 25000;
  }
}
