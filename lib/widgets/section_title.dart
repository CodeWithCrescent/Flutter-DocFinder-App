import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle, required this.onPressed,
  });
  final String title;
  final String subtitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: GlobalColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            subtitle,
            style: TextStyle(
              color: GlobalColor.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
