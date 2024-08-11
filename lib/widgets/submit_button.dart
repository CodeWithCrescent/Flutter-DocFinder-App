// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:doc_finder/constants/colors.dart';

class AuthSubmitButton extends StatefulWidget {
  const AuthSubmitButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final Widget title;
  final Function()? onPressed;

  @override
  State<AuthSubmitButton> createState() => _AuthSubmitButtonState();
}

class _AuthSubmitButtonState extends State<AuthSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(GlobalColor.white),
        backgroundColor: MaterialStatePropertyAll(GlobalColor.primary),
        fixedSize: MaterialStatePropertyAll(
          Size.fromWidth(MediaQuery.of(context).size.width),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15),
        ),
      ),
      child: widget.title,
    );
  }
}
