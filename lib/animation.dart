import 'package:flutter/material.dart';
import 'dart:ui';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({Key? key}) : super(key: key);

  static const String routeName = '/weather';

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: -9999).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 500,
          width: 500,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/cards/bad/attack_1.png'),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0.7),
          child: Transform.translate(
            offset: Offset(0, animation.value),
            child: Container(
              height: 250,
              width: 170,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/cards/cover.png'),
              )),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: ElevatedButton(
              onPressed: () {
                animationController.forward();
              },
              child: const Text('Go')),
        )
      ],
    );
  }
}
