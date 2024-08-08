import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityContainer extends StatelessWidget {
  const DoctorSpecialityContainer({
    super.key,
    required this.icon,
    required this.speciality,
  });

  final IconData icon;
  final String speciality;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: GlobalColor.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: GlobalColor.primary,
            size: 45,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.width / 65),
        Text(
          speciality,
          softWrap: true,
          style: TextStyle(
            color: GlobalColor.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        // SizedBox(height: MediaQuery.of(context).size.height / 85),
      ],
    );
  }
}
