import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/screens/get_started.dart';
import 'package:doc_finder/screens/home_screen.dart';
import 'package:doc_finder/screens/onboarding_screen.dart';
import 'package:doc_finder/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Booking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: GlobalColor.primary),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/get-started': (context) => const GetStarted(),
        '/onboarding': (context) => const OnBoardingScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
