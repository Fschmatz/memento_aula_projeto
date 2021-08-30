import 'package:memento_aula_projeto/shape.dart';
import 'iMemento.dart';
import 'memento.dart';

class Originator {
  late Shape state;

  Originator() {
    state = Shape.initial();
  }

  IMemento createMemento() {
    return Memento(state);
  }

  void restore(IMemento memento) {
    state = memento.getState();
  }
}