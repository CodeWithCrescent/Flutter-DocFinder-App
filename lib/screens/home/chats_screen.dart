import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: GlobalColor.primary,
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: GlobalColor.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      doctorProfileCircle(),
                      doctorProfileCircle(),
                      doctorProfileCircle(),
                      doctorProfileCircle(),
                      doctorProfileCircle(),
                      doctorProfileCircle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container doctorProfileCircle() {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: GlobalColor.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: GlobalColor.primary,
        size: 45,
      ),
    );
  }
}
