import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class NearbyHospitalCard extends StatelessWidget {
  const NearbyHospitalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: GlobalColor.white,
      surfaceTintColor: GlobalColor.white,
      elevation: 3,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 35),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/hospitals/1.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 25,
              vertical: MediaQuery.of(context).size.height / 40,
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
      ),
    );
  }
}
