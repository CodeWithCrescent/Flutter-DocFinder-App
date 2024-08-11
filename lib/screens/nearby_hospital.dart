import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/nearby_hospital_card.dart';
import 'package:flutter/material.dart';

class NearbyHospital extends StatefulWidget {
  const NearbyHospital({super.key});

  @override
  State<NearbyHospital> createState() => _NearbyHospitalState();
}

class _NearbyHospitalState extends State<NearbyHospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        title: const Text(
          'Nearby Hospitals',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        foregroundColor: GlobalColor.black,
        backgroundColor: GlobalColor.white,
        surfaceTintColor: GlobalColor.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 50,
          left: MediaQuery.of(context).size.width / 25,
          right: MediaQuery.of(context).size.width / 25,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  filterContainerButton(context, 'All', false),
                  filterContainerButton(context, 'Cardiology', true),
                  filterContainerButton(context, 'Dentist', false),
                  filterContainerButton(context, 'Heartbeat', true),
                  filterContainerButton(context, 'Pharmacy', false),
                  filterContainerButton(context, 'Health', false),
                ],
              ),
            ),
            const NearbyHospitalCard(),
            const NearbyHospitalCard(),
            const NearbyHospitalCard(),
            const NearbyHospitalCard(),
            const NearbyHospitalCard(),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
          ],
        ),
      ),
    );
  }

  Container filterContainerButton(
      BuildContext context, String title, bool isTapped) {
    return Container(
      height: MediaQuery.of(context).size.height / 25,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: isTapped
          ? BoxDecoration(
              color: GlobalColor.primary,
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              color: GlobalColor.white,
              border: Border.all(color: GlobalColor.muted),
              borderRadius: BorderRadius.circular(15),
            ),
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.height / 65),
      child: Text(
        title,
        style: TextStyle(
          color: isTapped ? GlobalColor.white : GlobalColor.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
