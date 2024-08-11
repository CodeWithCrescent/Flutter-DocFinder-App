import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/provider/auth_provider.dart';
import 'package:doc_finder/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckConnectivity extends StatefulWidget {
  const CheckConnectivity({super.key});
 

  @override
  State<CheckConnectivity> createState() => _CheckConnectivityState();
}

class _CheckConnectivityState extends State<CheckConnectivity> {
  @override
  void initState() {
    super.initState();
    _checkConnectivity(context);
  }

  Future<void> _checkConnectivity(context) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showNoInternetDialog();
      });
    } else {
      // Internet is available, check authentication status
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (authProvider.isAuthenticated) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text(
              'Please check your internet connection and try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _checkConnectivity(context);
              },
              child: const Text('Retry'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.primary,
      body: const SplashScreen(),
    );
  }
}
