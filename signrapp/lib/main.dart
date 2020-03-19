import 'dart:io';

import 'package:flutter/material.dart';
import 'package:signrapp/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signrapp/app/shared/utils/custom_http.dart';

// Esta classe permite acesso ao LocalHost com certificados HTTPS inválidos

void main() {
  HttpOverrides.global = CustomHttp();
  runApp(ModularApp(module: AppModule()));
}
