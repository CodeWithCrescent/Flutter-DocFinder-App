import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowAppDialog {
  static void error(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(description),
        titleTextStyle: TextStyle(
          color: GlobalColor.black,
          fontSize: 18,
        ),
        contentTextStyle: TextStyle(
          color: GlobalColor.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}
