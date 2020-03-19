import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signalr_client/hub_connection_builder.dart';
import 'package:signrapp/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final textController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.start();
  }

  void startConnection() async {
    await controller.start();
  }

  void sendMessage() async {
    await controller.sendMessage(textController.text);
    textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Observer(
            builder: (_) => ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (ctx, i) {
                    return Text(controller.messages[i]);
                  },
                )),
      ),
      bottomSheet: Container(
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.all(20),
        height: 90,
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(labelText: "Mensagem..."),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          sendMessage();
        },
      ),
    );
  }
}
