import 'package:doc_finder/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

Future<void> getCurrentPosition(context, String? token) async {
  final hasPermission = await handleLocationPermission(context);
  if (!hasPermission) return;

  try {
    final apiService = ApiService();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // ? Save location to db through api services
    await apiService.saveLocation(
      position.latitude,
      position.longitude,
      token!,
    );

    // Navigate to the home page
    Navigator.of(context).pushNamed(
      '/home',
      arguments: {'location': 'Makumbusho Stand'},
    );
  } catch (e) {
    debugPrint('Error getting position: $e');
  }
}
