import 'package:flutter/material.dart';
import 'package:switch_example/dark_mode.dart';

import 'first_page.dart';
import 'my_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}
