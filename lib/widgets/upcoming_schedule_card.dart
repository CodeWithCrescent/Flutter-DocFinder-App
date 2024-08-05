import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';


class UpcomingScheduleCard extends StatelessWidget {
  const UpcomingScheduleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: GlobalColor.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 18,
                    backgroundColor: GlobalColor.white,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: GlobalColor.muted,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 40),
                  Column(
                    children: [
                      Text(
                        'Dr. Alana Reueter',
                        style: TextStyle(
                          color: GlobalColor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Dentist Consultation',
                        style: TextStyle(
                          color: GlobalColor.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.width / 10,
                decoration: BoxDecoration(
                  color: GlobalColor.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.call_rounded,
                  color: GlobalColor.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: GlobalColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: GlobalColor.white,
                    ),
                    SizedBox(
                        width:
                            MediaQuery.of(context).size.width / 50),
                    Text(
                      'Moday, 26 Aug',
                      style: TextStyle(
                        color: GlobalColor.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 20,
                  color: GlobalColor.white,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: GlobalColor.white,
                    ),
                    SizedBox(
                        width:
                            MediaQuery.of(context).size.width / 50),
                    Text(
                      '09:00 - 10:00',
                      style: TextStyle(
                        color: GlobalColor.white,
                        fontSize: 15,
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
