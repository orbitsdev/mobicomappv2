import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/features/authentication/login_screen.dart';
import 'package:mobicom/features/exercises/exercises_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  bool isAuthenticated = false;

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // Initialize SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Retrieve user data from SharedPreferences
    final userData = prefs.getString('user');

    // Check if user data exists
    if (userData != null) {
      // User data exists, set isAuthenticated to true
      isAuthenticated = true;
    } else {
      // User data doesn't exist, set isAuthenticated to false
      isAuthenticated = false;
    }

    // If user is authenticated, allow navigation, otherwise redirect to login

    
    if (isAuthenticated) {
      return null;
    } else {
      return GetNavConfig.fromRoute(LoginScreen.name); // Redirect to login screen
    }
  }
}
