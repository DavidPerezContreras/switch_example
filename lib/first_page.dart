import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'my_switch.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  DarkMode darkMode = DarkMode(false);

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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => SecondPage(
              darkMode: widget.darkMode,
            ),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }),
      appBar: AppBar(
        actions: [MySwitch(darkMode: widget.darkMode)],
      ),
      body: SizedBox.expand(
          child: Container(
        color: color,
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
