import 'package:flutter/material.dart';
import 'package:memento_aula_projeto/mementoExample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memento Example',
      home: MementoExample(),
    );
  }
}

