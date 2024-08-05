import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          backgroundColor: GlobalColor.primary,
        ),
        onFinish: () {
          debugPrint('To Register page!!');
          Navigator.of(context).pushReplacementNamed('/register');
        },
        trailingFunction: () {
          debugPrint('To Login Page!!');
          Navigator.of(context).pushNamed('/login');
        },
        skipTextButton: const Text('Skip'),
        trailing: const Text('Login'),
        centerBackground: true,
        background: [
          Image.asset('assets/images/slide_1.png'),
          Image.asset('assets/images/slide_2.png'),
          Image.asset('assets/images/slide_3.png'),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Experienced',
                      softWrap: true,
                      style: TextStyle(
                        color: GlobalColor.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Doctors',
                  softWrap: true,
                  style: TextStyle(
                    color: GlobalColor.primary,
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
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Learn About',
                      style: TextStyle(
                        color: GlobalColor.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Your',
                      softWrap: true,
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Doctors',
                  softWrap: true,
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
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Effortless',
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Appointment',
                      softWrap: true,
                      style: TextStyle(
                        color: GlobalColor.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Booking',
                  softWrap: true,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
