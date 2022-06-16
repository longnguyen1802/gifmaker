import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Timer timer;

  final values = ['assets/img1.jpeg', 'assets/img3.jpeg', 'assets/img2.jpeg'];
  int _index = 0;
  int cur = 0;
  bool _stop = false;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() => _index = (_index + 1) % 3);
      if (!_stop) {
        cur = _index;
      }
     // print(cur);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: new GestureDetector(
          onTap: () {
            setState(() {
              _stop = !_stop;
            });
          },
          child: Center(
            child: _stop
                ? Image.asset(values[cur])
                : AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child: Image.asset(values[_index])),
          ),
        ));
  }
}
