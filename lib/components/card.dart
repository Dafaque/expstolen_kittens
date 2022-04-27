import 'dart:math';
import 'package:flutter/material.dart';

enum CardOrientation { towards, backwards }

class GameCard extends StatefulWidget {
  const GameCard(this.variant, {Key? key}) : super(key: key);

  final String variant;
  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard>
    with SingleTickerProviderStateMixin {
  late Image cardFront;
  late Image cardBack;
  bool showFront = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    cardFront = Image.asset("assets/cards/back.png");
    cardBack = Image.asset("assets/cards/${widget.variant}.png");
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300), value: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(cardFront.image, context);
    precacheImage(cardBack.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () async {
          await controller.forward();
          setState(() => showFront = !showFront);
          await controller.reverse();
        },
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationY((controller.value) * pi / 2),
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height - 130,
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: showFront ? cardFront : cardBack,
              ),
            );
          },
        ),
      ),
    );
  }
}
