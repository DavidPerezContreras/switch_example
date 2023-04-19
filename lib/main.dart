import 'package:flutter/material.dart';
import 'package:switch_example/dark_mode.dart';

import 'first_page.dart';
import 'my_switch.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  DarkMode darkMode=DarkMode(false);
  late MySwitch mySwitch;


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();

    widget.mySwitch=MySwitch(darkMode:widget.darkMode);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(darkMode: widget.darkMode, mySwitch: widget.mySwitch, ),
    );
  }
}
