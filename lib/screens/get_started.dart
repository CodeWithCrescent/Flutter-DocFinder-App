import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/provider/auth_provider.dart';
import 'package:doc_finder/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    if (auth.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    }
    return Scaffold(
      backgroundColor: GlobalColor.bg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          automaticallyImplyLeading: false,
          primary: false,
          backgroundColor: GlobalColor.bg,
        ),
      ),
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
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Ultimate Doctor',
                          style: TextStyle(
                            color: GlobalColor.primary,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Appointment Booking App',
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontSize: 22,
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
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 25),
                    AppButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/onboarding');
                      },
                      backgroundColor: GlobalColor.primary,
                      foregroundColor: GlobalColor.white,
                      fixedSize: 1.2,
                      text: 'Let\'s Get Started',
                      elevation: 5,
                      verticalPadding: 14,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                              GlobalColor.primary,
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 14),
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
