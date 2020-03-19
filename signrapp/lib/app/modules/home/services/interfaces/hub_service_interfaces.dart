import 'package:signalr_client/hub_connection.dart';

abstract class IHubService {
  Future startConnection();
  Future<void> ReceiveMessage(MethodInvacationFunc onReceiveMessage);
  onClose(ClosedCallback onClose);
  Future sendMessage(String text);
}
