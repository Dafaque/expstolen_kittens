import 'package:exploden_kittens/components/error.dart';
import 'package:exploden_kittens/components/loader.dart';
import 'package:exploden_kittens/controllers/init.dart';
import 'package:exploden_kittens/router/routes.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  InitialPage({Key? key}) : super(key: key);
  final InitApp initController = InitApp();

  @override
  Widget build(BuildContext context) {
    initController.setContext(context);
    Loader loader = const Loader();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Загрузка"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: initController.getStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorView(
                  snapshot.error.toString(), snapshot.stackTrace?.toString());
            }
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loader,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data.toString()),
                  )
                ],
              );
            }
            initController.load();
            return loader;
          },
        ),
      ),
    );
  }
}
