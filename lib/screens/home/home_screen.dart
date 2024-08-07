import 'package:doc_finder/widgets/doctor_speciality_container.dart';
import 'package:doc_finder/widgets/hospital_card.dart';
import 'package:doc_finder/widgets/section_title.dart';
import 'package:doc_finder/widgets/upcoming_schedule_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        // top: MediaQuery.of(context).size.height / 50,
        left: MediaQuery.of(context).size.height / 50,
        right: MediaQuery.of(context).size.height / 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Upcoming Schedule',
            subtitle: 'See All',
          ),
          // Upcoming Schedule
          const UpcomingScheduleCard(),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          const SectionTitle(
            title: 'Doctor Speciality',
            subtitle: 'See All',
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const DoctorSpecialityContainer(
                  icon: Icons.heart_broken_rounded,
                  speciality: 'Dentist',
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                const DoctorSpecialityContainer(
                  icon: Icons.luggage_rounded,
                  speciality: 'Cardiology',
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                const DoctorSpecialityContainer(
                  icon: Icons.heart_broken_rounded,
                  speciality: 'Neurology',
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                const DoctorSpecialityContainer(
                  icon: Icons.heart_broken_rounded,
                  speciality: 'Orthopaegoe',
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                const DoctorSpecialityContainer(
                  icon: Icons.heart_broken_rounded,
                  speciality: 'Children',
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                const DoctorSpecialityContainer(
                  icon: Icons.heart_broken_rounded,
                  speciality: 'Wenye Mimba',
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          const SectionTitle(
            title: 'Nearby Hospitals',
            subtitle: 'See All',
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const HospitalCard(),
                SizedBox(width: MediaQuery.of(context).size.width / 25),
                const HospitalCard(),
                SizedBox(width: MediaQuery.of(context).size.width / 25),
                const HospitalCard(),
                SizedBox(width: MediaQuery.of(context).size.width / 25),
                const HospitalCard(),
                SizedBox(width: MediaQuery.of(context).size.width / 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
