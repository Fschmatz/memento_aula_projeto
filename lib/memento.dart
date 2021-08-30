import 'package:memento_aula_projeto/iMemento.dart';
import 'package:memento_aula_projeto/shape.dart';

class Memento extends IMemento{
  late Shape _state;

  Memento(Shape shape){
    _state = Shape.copy(shape);
  }


  Shape getState() {
   return _state;
  }

}