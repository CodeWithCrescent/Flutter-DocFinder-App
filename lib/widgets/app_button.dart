import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.fixedSize,
    required this.text, required this.elevation, required this.verticalPadding,
  });
  final Function() onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double fixedSize;
  final double elevation;
  final double verticalPadding;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
        elevation: MaterialStatePropertyAll(elevation),
        fixedSize: MaterialStateProperty.all(
          Size.fromWidth(MediaQuery.of(context).size.width / fixedSize),
        ),
        padding: MaterialStateProperty.all(
           EdgeInsets.symmetric(vertical: verticalPadding),
        ),
      ),
      child: Text(text),
    );
  }
}
