import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import 'services/interfaces/hub_service_interfaces.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final IHubService hubService;
  @observable
  ObservableList<String> messages = ObservableList<String>();

  _HomeBase({this.hubService});

  start() {
    hubService.onClose((_) {
      print("Conexão perdida");
    });
    hubService.ReceiveMessage(onReceiveMessage);
    startConnection();
  }

  void startConnection() async {
    await hubService.startConnection(); // Inicia a conexão ao servidor
  }

  @action
  void onReceiveMessage(List<Object> result) {
    messages.add("${result[0]} diz: ${result[1]}");
  }

  Future sendMessage(String text) async {
    return hubService.sendMessage(text);
  }
}
