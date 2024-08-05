import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/doctor_speciality_container.dart';
import 'package:doc_finder/widgets/hospital_card.dart';
import 'package:doc_finder/widgets/main_search_row.dart';
import 'package:doc_finder/widgets/section_title.dart';
import 'package:doc_finder/widgets/upcoming_schedule_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 50,
            left: MediaQuery.of(context).size.height / 50,
            right: MediaQuery.of(context).size.height / 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          color: GlobalColor.muted,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 95),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/enter-location-manually',
                            arguments: {'title': 'Change Your Location'},
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: GlobalColor.primary,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 95),
                            Text(
                              'Makumbusho Stand, Dsm',
                              style: TextStyle(
                                color: GlobalColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: GlobalColor.black,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: GlobalColor.black.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_rounded,
                      color: GlobalColor.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              // Main Search Row
              MainSearchRow(searchController: _searchController),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
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
        ),
      ),
    );
  }
}
