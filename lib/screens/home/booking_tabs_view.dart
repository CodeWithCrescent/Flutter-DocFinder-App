import 'package:doc_finder/widgets/booking_card.dart';
import 'package:flutter/material.dart';

class BookingsTabsView extends StatefulWidget {
  const BookingsTabsView({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<BookingsTabsView> createState() => _BookingsTabsViewState();
}

class _BookingsTabsViewState extends State<BookingsTabsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      physics: const ClampingScrollPhysics(),
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              children: [
                BookingCard(
                  date: 'Aug 12, 2024',
                  time: '06:22 AM',
                  bookingId: 'A45E91W54',
                  doctorName: 'Angel Kairuki',
                  doctorLocation: 'A204 Nyerere Rd. Ilala',
                  doctorProfile: 'assets/images/profile/2.jpg',
                  isUpcoming: true,
                  isOnRemindMe: true,
                  isCancelled: false,
                  leftButtonText: 'Cancel',
                  rightButtonText: 'Reschedule',
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              children: [
                BookingCard(
                  date: 'Aug 25, 2024',
                  time: '11:45 AM',
                  bookingId: 'A45E91W54',
                  doctorName: 'Angel Kairuki',
                  doctorLocation: 'A204 Nyerere Rd. Ilala',
                  doctorProfile: 'assets/images/profile/2.jpg',
                  isUpcoming: false,
                  isOnRemindMe: false,
                  isCancelled: false,
                  leftButtonText: 'Re-Book',
                  rightButtonText: 'Add Review',
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              children: [
                BookingCard(
                  date: 'Aug 25, 2024',
                  time: '11:45 AM',
                  bookingId: 'A45E91W54',
                  doctorName: 'Angel Kairuki',
                  doctorLocation: 'A204 Nyerere Rd. Ilala',
                  doctorProfile: 'assets/images/profile/2.jpg',
                  isUpcoming: false,
                  isOnRemindMe: false,
                  isCancelled: true,
                  leftButtonText: 'Cancel',
                  rightButtonText: 'Add Review',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
