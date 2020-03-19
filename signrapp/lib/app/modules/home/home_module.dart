import 'package:signrapp/app/modules/home/services/hub_service.dart';
import 'package:signalr_client/hub_connection_builder.dart';
import 'package:signrapp/app/modules/home/repositories/hub_repository.dart';
import 'package:signrapp/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signrapp/app/modules/home/home_page.dart';
import 'package:signrapp/app/shared/utils/settings.dart';

import 'repositories/interfaces/hub_repository_interfaces.dart';
import 'services/interfaces/hub_service_interfaces.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IHubService>(
            (i) => HubService(hubRepository: i.get<IHubRepository>())),
        Bind<IHubRepository>((i) => HubRepository(
            hubConnection:
                HubConnectionBuilder().withUrl(Settings.apiUrl).build())),
        Bind((i) => HomeController(hubService: i.get<IHubService>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
