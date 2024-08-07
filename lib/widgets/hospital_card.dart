import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  const HospitalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 8,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/hospitals/1.jpg'),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          // height: MediaQuery.of(context).size.height / 8,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 25,
            vertical: MediaQuery.of(context).size.height / 65,
          ),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 75,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            color: GlobalColor.primary.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Meta Women Hospital',
                style: TextStyle(
                  color: GlobalColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Maternity, Women',
                style: TextStyle(
                  color: GlobalColor.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: GlobalColor.primary,
                    textDirection: TextDirection.ltr,
                    size: 15,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 65),
                  Text(
                    '8502 Makumbusho, Ilala',
                    style: TextStyle(
                      color: GlobalColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.av_timer,
                    color: GlobalColor.primary,
                    textDirection: TextDirection.ltr,
                    size: 15,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 65),
                  Text(
                    '15 min . 1.5km',
                    style: TextStyle(
                      color: GlobalColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
