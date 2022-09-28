import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

enum Shape {
  square,
  circle,
  stadium,
}

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final Shape shape;
  const CalculatorButton(
      {super.key,
      required this.text,
      this.textColor = kSecondaryColor,
      this.fontSize = 40,
      this.fontWeight = FontWeight.bold,
      this.width = 68,
      this.shape = Shape.square});

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isPassed = false;
  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.shape == Shape.circle
        ? null
        : BorderRadius.circular(widget.shape == Shape.square ? 20 : 36);
    final shape =
        widget.shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle;
    return Listener(
      onPointerDown: (_) => setState(() {
        isPassed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPassed = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        width: widget.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(-3, -3),
              blurRadius: 5,
              color: const Color(0x00FFFFFF),
              inset: isPassed,
            ),
            BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 5,
              color: const Color(0x00838E9E),
              inset: isPassed,
            ),
            BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 5,
              color: isPassed ? Colors.transparent : const Color(0xCCFFFFFF),
              inset: true,
            ),
            BoxShadow(
              offset: const Offset(-3, -3),
              blurRadius: 5,
              color: isPassed ? Colors.transparent : const Color(0x00838E9E),
              inset: true,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
