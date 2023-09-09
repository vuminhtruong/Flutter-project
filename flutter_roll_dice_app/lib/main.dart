import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientContainer(Color.fromARGB(200, 15, 10, 187),
          Color.fromARGB(120, 34, 2, 63)),
    ),
  ));
}
