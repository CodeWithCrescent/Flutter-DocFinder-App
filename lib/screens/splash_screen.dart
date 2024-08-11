import 'dart:async';

import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    // Allow time for any initialization (like checking authentication)
    await Future.delayed(const Duration(milliseconds: 3000));

    if (mounted) {
      final auth = Provider.of<AuthProvider>(context, listen: false);

      // Navigate based on authentication status
      if (auth.isAuthenticated) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/get-started');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          automaticallyImplyLeading: false,
          primary: false,
          backgroundColor: GlobalColor.primary,
        ),
      ),
      body: Center(
        child: Text(
          'DocFinder',
          style: TextStyle(
            color: GlobalColor.white,
            fontSize: 42,
            fontFamily: 'Pacifico',
          ),
        ),
      ),
    );
  }
}
