import 'package:exploden_kittens/constants/colors.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.err, this.stack, {Key? key}) : super(key: key);
  final String err;
  final String? stack;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            err,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
            child: Divider(
              height: 1.0,
              thickness: 2.0,
              indent: 0.0,
              endIndent: 10.0,
              color: colorBackgroundRed,
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(stack ?? "Стека нет"),
            ),
          ),
        ]);
  }
}
