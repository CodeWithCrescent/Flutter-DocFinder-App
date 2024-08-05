import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class LocationAccess extends StatelessWidget {
  const LocationAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: GlobalColor.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logo/location-pointer.png',
                  color: GlobalColor.primary,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What is',
                    style: TextStyle(
                      color: GlobalColor.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Your Location?',
                    softWrap: true,
                    style: TextStyle(
                      color: GlobalColor.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 85),
              Text(
                'We need to know your location in order to suggest nearby services.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColor.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/enter-location-manually');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(GlobalColor.primary),
                    foregroundColor:
                        MaterialStatePropertyAll(GlobalColor.white),
                    elevation: const MaterialStatePropertyAll(5),
                    fixedSize: MaterialStateProperty.all(
                      Size.fromWidth(MediaQuery.of(context).size.width / 1.2),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 18),
                    ),
                    textStyle: const MaterialStatePropertyAll(TextStyle(
                      fontSize: 16,
                    ))),
                child: const Text('Allow Location Access'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/enter-location-manually',
                    arguments: {'title': 'Enter Your Location'},
                  );
                },
                child: Text(
                  'Enter Location Manually',
                  style: TextStyle(
                    color: GlobalColor.primary,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
            ],
          ),
        ),
      ),
    );
  }
}
