import 'package:flutter_modular/flutter_modular.dart';
import 'package:signalr_client/hub_connection.dart';
import 'package:signrapp/app/modules/home/repositories/interfaces/hub_repository_interfaces.dart';

class HubRepository extends Disposable implements IHubRepository {
  final HubConnection hubConnection;

  HubRepository({this.hubConnection});

  Future startConnection() {
    return hubConnection.start();
  }

  onClose(ClosedCallback onClose) {
    hubConnection.onclose(onClose);
  }

  Future<void> ReceiveMessage(MethodInvacationFunc onReceiveMessage) {
    hubConnection.on("ReceiveMessage", onReceiveMessage);
  }

  Future sendMessage(String text) {
    return hubConnection.invoke("SendMessage",
        args: <Object>["Flutter", text]).catchError((err) {
      print(err);
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
