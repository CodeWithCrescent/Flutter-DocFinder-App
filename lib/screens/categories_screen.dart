import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/doctor_speciality_container.dart';
import 'package:flutter/material.dart';

class DoctorCategoriesScreen extends StatefulWidget {
  const DoctorCategoriesScreen({super.key});

  @override
  State<DoctorCategoriesScreen> createState() => _DoctorCategoriesScreenState();
}

class _DoctorCategoriesScreenState extends State<DoctorCategoriesScreen> {
  final List<String> _speciality = List.generate(
    40,
    (index) => 'Speciality ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        title: const Text(
          'Category',
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
            Navigator.of(context).pushNamed('/home');
            // .pushNamedAndRemoveUntil('/home', (route) => false);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: _speciality.length,
          itemBuilder: (context, index) => DoctorSpecialityContainer(
            icon: Icons.heart_broken_rounded,
            speciality: _speciality[index],
          ),
        ),
      ),
    );
  }
}
