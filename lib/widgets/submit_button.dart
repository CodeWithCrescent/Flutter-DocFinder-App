import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({super.key, required this.title, this.onPressed});

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
