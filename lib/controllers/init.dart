import 'dart:async';

import 'package:exploden_kittens/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class InitApp {
  InitApp();
  final StreamController<String> _chan = StreamController<String>();
  late final NavigatorState navigator;
  void load() async {
    try {
      _chan.sink.add("Готово!");
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        navigator.pushNamedAndRemoveUntil(CustomRouter.main, (_) => false);
      });
    } catch (err, stack) {
      _chan.sink.addError(err, stack);
    }
    _chan.close();
  }

  void setContext(BuildContext ctx) {
    navigator = Navigator.of(ctx);
  }

  Stream<String> getStream() {
    return _chan.stream;
  }
}
