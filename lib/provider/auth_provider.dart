import 'package:doc_finder/components/app_dialogs.dart';
import 'package:doc_finder/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  bool get isAuthenticated => _token != null;

  final ApiService _apiService = ApiService();

  Future<void> register(
      String name, String email, String password, context) async {
    final response = await _apiService.register(name, email, password);

    if (response.statusCode == 200) {
      _token = response.data['token'];
      notifyListeners();

      // Navigate to the ask permission for location with token
      Navigator.pushReplacementNamed(context, '/location-access',
          arguments: {'token': _token});
    } else {
      ShowAppDialog.error(
        context,
        title: 'Register Error!',
        description: response.data['message'],
      );
      // throw Exception('Registration failed');
    }
  }

  Future<void> login(String email, String password, context) async {
    try {
      final response = await _apiService.login(email, password);

      if (response.statusCode == 200) {
        _token = response.data['token'];
        notifyListeners();

        // Navigate to a Home page after successful login
        Navigator.pushReplacementNamed(context, '/home',
            arguments: {'token': _token});
      } else {
        ShowAppDialog.error(
          context,
          title: 'Login Error!',
          description: response.data['message'],
        );
      }
    } catch (e) {
      ShowAppDialog.error(
        context,
        title: 'Login Failed!',
        description: 'Unexpected error occured. Try again later',
      );
      // throw Exception('Login failed: $e');
    }
  }

  Future<void> fetchData() async {
    if (_token == null) return;

    final response = await _apiService.getData(_token!);

    if (response.statusCode == 200) {
      // Handle your data
    } else {
      throw Exception('Failed to retrieve data');
    }
  }

  Future<void> logout(context) async {
    _token = null;
    notifyListeners();
    // Navigate to the login page on sign out
    Navigator.pushReplacementNamed(context, '/login');
  }
}
