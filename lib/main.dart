import 'package:flutter/material.dart';

import 'mementoExample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memento Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MementoExample(),
    );
  }
}
