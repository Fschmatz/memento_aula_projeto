import 'package:flutter/material.dart';
import 'package:memento_aula_projeto/shape.dart';


class ShapeContainer extends StatelessWidget {
  final Shape shape;

  const ShapeContainer({
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: shape.height,
          width: shape.width,
          decoration: BoxDecoration(
            color: shape.color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Icon(
            Icons.thumb_up_alt_outlined,
            size: 50,
          ),
        ),
      ),
    );
  }
}