import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.bg,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                'DocFinder',
                style: TextStyle(
                  color: GlobalColor.primary,
                  fontSize: 42,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 28, left: 24, right: 24),
                decoration: BoxDecoration(
                  color: GlobalColor.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your',
                          style: TextStyle(
                            color: GlobalColor.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Ultimate Doctor',
                          style: TextStyle(
                            color: GlobalColor.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Appointment Booking App',
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    Text(
                      'Book appointments effortlessly and manage your health journey.',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: GlobalColor.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 25),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/onboarding');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(GlobalColor.primary),
                        foregroundColor:
                            MaterialStatePropertyAll(GlobalColor.white),
                        elevation: const MaterialStatePropertyAll(5),
                        fixedSize: MaterialStateProperty.all(
                          Size.fromWidth(
                              MediaQuery.of(context).size.width / 1.2),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 18),
                        ),
                      ),
                      child: const Text('Let\'s Get Started'),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: GlobalColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                              GlobalColor.primary,
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
