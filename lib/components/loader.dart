import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage("assets/loaders/loader.webp"),
        filterQuality: FilterQuality.high,
        height: 100,
      ),
    );
  }
}
