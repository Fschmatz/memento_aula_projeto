import 'package:flutter/material.dart';

class Shape{
  Color? color;
  double? height;
  double? width;

  Shape(this.color, this.height, this.width);

  Shape.initial(){
    color = Colors.blueGrey;
    height = 200.0;
    width = 200.0;
  }

  Shape.copy(Shape shape) : this(shape.color, shape.height, shape.width);
}