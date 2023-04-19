import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'my_switch.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key, required this.darkMode, required this.mySwitch});

  DarkMode darkMode;
  MySwitch mySwitch;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
      floatingActionButton: FloatingActionButton(onPressed: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              darkMode: widget.darkMode,
              mySwitch: widget.mySwitch,
            ),
          ),
        );
      }),
      appBar: AppBar(
        actions: [widget.mySwitch],
      ),
      body: SizedBox.expand(
          child: Container(
        color: color,
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
