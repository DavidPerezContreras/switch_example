import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(true);

  MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();

    widget.valueNotifier.addListener(() {
      setState(() {
        if (widget.valueNotifier.value) {
          color = Colors.black;
        } else {
          color = Colors.red;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [MySwitch(isDark: widget.valueNotifier)],
      ),
      body: SizedBox.expand(
          child: Container(
        color: color,
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MySwitch extends StatefulWidget {
  MySwitch({required this.isDark, super.key});

  ValueNotifier<bool> isDark;

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
        value: widget.isDark.value,
        onChanged: (value) {
          setState(() => widget.isDark.value = value);
        });
    ;
  }
}
