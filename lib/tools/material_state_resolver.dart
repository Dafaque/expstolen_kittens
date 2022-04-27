import 'package:flutter/material.dart';

Color materialStateColorResolve(Color color, Set<MaterialState> states) {
  double opacity = 0.8;
  if (states.contains(MaterialState.hovered)) {
    opacity = 0.9;
  }
  if (states.contains(MaterialState.pressed)) {
    opacity = 1.0;
  }
  return color.withOpacity(opacity);
}
