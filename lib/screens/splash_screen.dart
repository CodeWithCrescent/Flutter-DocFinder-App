import 'dart:async';

import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

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

  Future initializeApp() async {
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacementNamed('/get-started');
    });
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
