import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/provider/auth_provider.dart';
import 'package:doc_finder/screens/auth/auth_screen.dart';
import 'package:doc_finder/screens/cancel_booking_screen.dart';
import 'package:doc_finder/screens/categories_screen.dart';
import 'package:doc_finder/screens/get_started.dart';
import 'package:doc_finder/screens/layout_screen.dart';
import 'package:doc_finder/screens/location_access.dart';
import 'package:doc_finder/screens/location_manually.dart';
import 'package:doc_finder/screens/nearby_hospital.dart';
import 'package:doc_finder/screens/onboarding_screen.dart';
import 'package:doc_finder/services/check_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(builder: (context, auth, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Doctor Booking App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: GlobalColor.primary),
            useMaterial3: true,
          ),
          home: const CheckConnectivity(),
          routes: {
            '/get-started': (context) => const GetStarted(),
            '/onboarding': (context) => const OnBoardingScreen(),
            '/login': (context) => AuthScreen(pageNumber: 1),
            '/register': (context) => AuthScreen(pageNumber: 2),
            '/forgot-password': (context) => AuthScreen(pageNumber: 3),
            '/verify-code': (context) => AuthScreen(pageNumber: 4),
            '/new-password': (context) => AuthScreen(pageNumber: 5),
            '/location-access': (context) => const LocationAccess(),
            '/enter-location-manually': (context) =>
                const EnterLocationManually(),
            '/home': (context) => const AppLayoutScreen(),
            '/nearby-hospitals': (context) => const NearbyHospital(),
            '/categories': (context) => const DoctorCategoriesScreen(),
            '/cancel-booking': (context) => const CancelBookingScreen(),
          },
        );
      }),
    );
  }
}
