import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/features/authentication/login_screen.dart';
import 'package:mobicom/features/exercises/exercises_screen.dart';
import 'package:mobicom/features/home_screen.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/services/api.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isAuthenticated = false.obs;

  var loginIsLoading = false.obs;

  var user = User().obs;

  void test() {
    print('test');
  }

  EitherModel<String?> login(
  BuildContext context, Map<String, dynamic> formData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    Dialogs.showLoadingDialog(context); // Show loading dialog

    final response = await http.post(Uri.parse(Api.login), body: formData);
    final responseData = jsonDecode(response.body);

    if (responseData['success']) {
      // print(responseData['data']['data']);
      user(User.fromMap(responseData['data'] as Map<String, dynamic>));
      // print(responseData)
      await prefs.setString('user', user.toJson());
      user(User.fromMap(responseData['data'] as Map<String, dynamic>));
      print(user.toJson());

      if (user.value.token!.isNotEmpty) {
        // Dismiss loading dialog before navigating
        Get.back();
        Get.offAll(() => HomeScreen(), transition: Transition.cupertino);
      }

      return right(null);
    } else {
      Map<String, dynamic> errors = responseData['error'] ?? {};
      String errorMessage = '';

      if (errors.isNotEmpty) {
        if (errors.containsKey('email')) {
          errorMessage = errors['email'][0];
        } else if (errors.containsKey('password')) {
          errorMessage = errors['password'][0];
        } else {
          print(errors);
        }
        Dialogs.showErrorDialog(context, errorMessage);
      }
      return left('Login failed');
    }
  } on SocketException catch (e) {
    Dialogs.showErrorDialog(context, e.message);
    return left('Network error: ${e.message}');
  } catch (e) {
    Dialogs.showErrorDialog(context, e.toString());
    return left('Error: ${e.toString()}');
  } finally {
    // Dismiss loading dialog if it's still shown
    Get.back();
  }
}


Future<void> logout(BuildContext context) async {
  try {
    Dialogs.showLoadingDialog(context); // Show loading dialog

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('token');

    if (accessToken != null) {
      // Make API call to logout
      final response = await http.post(
        Uri.parse(Api.logout),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        // Clear user data from SharedPreferences
        await prefs.remove('token');
        await prefs.remove('user');

        // Navigate to the login screen
        Get.offAll(() => LoginScreen(), transition: Transition.cupertino);
      } else {
        throw Exception('Failed to logout');
      }
    } else {
      // No access token found, force logout locally
      await forceLogout();
    }
  } catch (e) {
    // Show error dialog
    Dialogs.showErrorDialog(context, 'Error during logout: $e');
    
    // Force logout locally regardless of error
    await forceLogout();
  } finally {
    // Dismiss loading dialog regardless of success or failure
    Get.back();
  }
}

Future<void> forceLogout() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Clear user data from SharedPreferences
    await prefs.remove('token');
    await prefs.remove('user');

    // Navigate to the login screen
    Get.offAll(() => LoginScreen(), transition: Transition.cupertino);
  } catch (e) {
    // Handle any errors during force logout
    print('Error during force logout: $e');
  }
}




  EitherModel<String?> register(BuildContext context, data) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    // Initialize SharedPreferences

    var response = await http.post(Uri.parse(Api.register), body: data);
    var responseData = jsonDecode(response.body);

    if (responseData['success']) {
      user.value = User.fromMap(responseData['data'] as Map<String, dynamic>); // Update user value
      print(user.toJson());
      await prefs.setString('user', user.toJson());
      String? new_user = prefs.getString('user');

      if (user.value.first_name!.isNotEmpty) {
        Get.offAll(() => HomeScreen(), transition: Transition.cupertino);
      }

      return right(null);
    } else {
      Map<String, dynamic> errors = responseData['error'] ?? {};
      String errorMessage = '';

      if (errors.isNotEmpty) {
        // Check for specific field errors
        if (errors.containsKey('email')) {
          errorMessage = errors['email'][0];
        } else if (errors.containsKey('first_name')) {
          errorMessage = errors['first_name'][0];
        } else if (errors.containsKey('last_name')) {
          errorMessage = errors['last_name'][0];
        } else if (errors.containsKey('enrolled_section_id')) {
          errorMessage = errors['enrolled_section_id'][0];
        } else if (errors.containsKey('password')) {
          errorMessage = errors['password'][0];
        } else {
          print(errors);
        }
        Dialogs.showErrorDialog(context, errorMessage);
      }
      return left('Registration failed');
    }
  } on SocketException catch (e) {
    Dialogs.showErrorDialog(context, e.message);
    return left('No internet connection');
  } catch (e) {
    Dialogs.showErrorDialog(context, e.toString());
    return left(e.toString());
  }
}

}





