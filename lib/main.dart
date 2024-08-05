import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/screens/auth/auth_screen.dart';
import 'package:doc_finder/screens/get_started.dart';
import 'package:doc_finder/screens/home_screen.dart';
import 'package:doc_finder/screens/location_access.dart';
import 'package:doc_finder/screens/location_manually.dart';
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
        '/login': (context) => AuthScreen(pageNumber: 1),
        '/register': (context) => AuthScreen(pageNumber: 2),
        '/forgot-password': (context) => AuthScreen(pageNumber: 3),
        '/verify-code': (context) => AuthScreen(pageNumber: 4),
        '/new-password': (context) => AuthScreen(pageNumber: 5),
        '/location-access': (context) => const LocationAccess(),
        '/enter-location-manually': (context) => const EnterLocationManually(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
