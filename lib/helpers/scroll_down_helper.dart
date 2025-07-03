import 'package:flutter/material.dart';

final ScrollController controllerDown = ScrollController();

void scrollDown() {
  controllerDown.animateTo(
    0,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeIn,
  );
}
