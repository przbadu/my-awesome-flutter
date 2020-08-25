import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    @required this.text,
    this.color: Colors.black87,
    this.elevation: 0,
    this.onPressed,
    this.backgroundColor,
    this.icon,
  });
  final String text;
  final Icon icon;
  final Color color;
  final Color backgroundColor;
  final double elevation;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
      shape: CircleBorder(),
      elevation: elevation,
      color: backgroundColor ?? Colors.transparent,
    );
  }
}
