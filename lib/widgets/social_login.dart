import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.social});
  final String social;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 40,
          horizontal: MediaQuery.of(context).size.width / 40,
        ),
        side: BorderSide(width: 1, color: GlobalColor.muted),
      ),
      onPressed: () {
        debugPrint('Social $social Clicked!');
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 15,
        child: Image.asset(
          'assets/logo/$social.png',
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
