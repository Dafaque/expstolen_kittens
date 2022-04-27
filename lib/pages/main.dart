import 'package:exploden_kittens/router/routes.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  void _navigateTo(String routePath) {}

  void _newSession() {
    return _navigateTo(CustomRouter.init);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("<userame>".toUpperCase()), actions: [
        TextButton(onPressed: () {}, child: const Text("Создать акк")),
        TextButton(onPressed: () {}, child: const Text("Выйти")),
      ]),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: _newSession,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Присоединиться"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: _newSession,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Создать игру"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: _newSession,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Все игры"),
              ),
            ),
          )
        ],
      )),
    );
  }
}
