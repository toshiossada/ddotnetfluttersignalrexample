import 'package:flutter_modular/flutter_modular.dart';
import 'package:signrapp/app/modules/home/repositories/interfaces/hub_repository_interfaces.dart';

import 'interfaces/hub_service_interfaces.dart';

class HubService extends Disposable implements IHubService {
  final IHubRepository hubRepository;

  HubService({this.hubRepository});

  Future startConnection() {
    return hubRepository.startConnection(); // Inicia a conexão ao servidor
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<void> ReceiveMessage(onReceiveMessage) {
    hubRepository.ReceiveMessage(onReceiveMessage);
  }

  @override
  onClose(onClose) {
    hubRepository.onClose(onClose);
  }

  @override
  Future sendMessage(String text) {
    return hubRepository.sendMessage(text);
  }
}
