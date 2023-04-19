import 'package:flutter/material.dart';
import 'package:switch_example/first_page.dart';

import 'dark_mode.dart';
import 'my_switch.dart';

class SecondPage extends StatefulWidget {
  SecondPage({super.key, required this.darkMode, required this.mySwitch});

  DarkMode darkMode;
  MySwitch mySwitch;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();

    if (widget.darkMode.value) {
      color = Colors.black;
    } else {
      color = Colors.red;
    }

    widget.darkMode.addListener(() {
      setState(() {
        if (widget.darkMode.value) {
          color = Colors.black;
        } else {
          color = Colors.red;
        }
      });
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FirstPage(
                  darkMode: widget.darkMode,
                  mySwitch: widget.mySwitch,
                ),
              ),
            );
          },
        ),
        actions: [
          widget.mySwitch,
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          color: color,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
