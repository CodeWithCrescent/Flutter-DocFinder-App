import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

// ignore: must_be_immutable
class BookingCard extends StatefulWidget {
  BookingCard({
    super.key,
    required this.date,
    required this.time,
    required this.doctorProfile,
    required this.doctorName,
    required this.doctorLocation,
    required this.bookingId,
    required this.isOnRemindMe,
    required this.isUpcoming,
    required this.isCancelled,
    required this.rightButtonText,
    required this.leftButtonText,
  });
  final String date,
      time,
      doctorProfile,
      doctorName,
      doctorLocation,
      bookingId,
      rightButtonText,
      leftButtonText;
  bool isOnRemindMe;
  bool isUpcoming;
  bool isCancelled;

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 40),
      color: GlobalColor.white,
      surfaceTintColor: GlobalColor.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.date} - ${widget.time}',
                  style: TextStyle(
                    color: GlobalColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (widget.isUpcoming)
                  Row(
                    children: [
                      Text(
                        'Remind me',
                        style: TextStyle(
                          color: GlobalColor.muted,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      FlutterSwitch(
                        height: 20.0,
                        width: 40.0,
                        toggleSize: 18.0,
                        padding: 2,
                        borderRadius: 20.0,
                        activeColor: GlobalColor.primary,
                        inactiveColor: GlobalColor.primary.withOpacity(0.3),
                        value: widget.isOnRemindMe,
                        onToggle: (value) {
                          setState(() {
                            widget.isOnRemindMe = value;
                          });
                        },
                      ),
                    ],
                  ),
              ],
            ),
            const Divider(
              thickness: 0.5,
              height: 25,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 8,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.doctorProfile,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctorName,
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    iconTextRow(
                      Icons.location_pin,
                      widget.doctorLocation,
                    ),
                    const SizedBox(height: 5),
                    iconTextRow(
                      Icons.filter_center_focus,
                      '#${widget.bookingId}',
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 0.5,
              height: 25,
            ),
            Row(
              children: [
                if (!widget.isCancelled)
                  AppButton(
                    onPressed: () {},
                    backgroundColor: GlobalColor.primary.withOpacity(0.2),
                    foregroundColor: GlobalColor.primary,
                    fixedSize: 2.5,
                    text: widget.leftButtonText,
                    elevation: 0,
                    verticalPadding: 12,
                  ),
                if (!widget.isCancelled)
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                AppButton(
                  onPressed: () {},
                  backgroundColor: GlobalColor.primary,
                  foregroundColor: GlobalColor.white,
                  fixedSize: widget.isCancelled ? 1.2 : 2.5,
                  text: widget.rightButtonText,
                  elevation: 5,
                  verticalPadding: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row iconTextRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: GlobalColor.primary,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: GlobalColor.muted,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
