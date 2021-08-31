import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'iMemento.dart';
import 'iCommand.dart';
import 'originator.dart';

class RandomisePropertiesCommand implements ICommand {
  final Originator originator;
  late final IMemento _backup;

  RandomisePropertiesCommand(this.originator) {
    _backup = originator.createMemento();
  }

  @override
  void execute() {
    final shape = originator.state;

    shape.color = Color.fromRGBO(random.integer(255, min: 50),
        random.integer(255, min: 50), random.integer(255, min: 50), 1.0);
    shape.height = random.integer(200, min: 80).toDouble();
    shape.width = random.integer(200, min: 80).toDouble();
  }

  @override
  void undo() {
    originator.restore(_backup);
  }
}
