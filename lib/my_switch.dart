import 'package:flutter/material.dart';
import 'package:switch_example/dark_mode.dart';

class MySwitch extends StatefulWidget {
  MySwitch({required this.darkMode, super.key});

  DarkMode darkMode = DarkMode(false);

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: widget.darkMode.value,
        onChanged: (value) {
          setState(() {
            widget.darkMode.value = value;
            widget.darkMode.onSwitch(value);
          },);
        });
    ;
  }
}
