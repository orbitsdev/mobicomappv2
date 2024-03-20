import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

 Future<User?> fetchUserFromApi() async {
  final url = Uri.parse(Api.user); // Replace with your API endpoint
  final token = user.value.token;



  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseData = jsonDecode(response.body);
    if (responseData['success']) {
        var current_token = user.value.token;
      
        User new_user = User.fromMap(responseData['data']);
        new_user.token = current_token;
        user(new_user);

          if(user.value.student_id == null){
            logoutNotAuthorize();
            
Fluttertoast.showToast(
        msg: "This account is no longer enrolled.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
          }

        print(user.toJson());
        print('________');
      
    } else {
      throw Exception('Failed to load user data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}


EitherModel<String?> uploadProfileImage(BuildContext context, File imageFile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Dialogs.showLoadingDialog(context); // Show loading dialog

      // Create multipart request for uploading the image
      var request = http.MultipartRequest('POST', Uri.parse(Api.upload_profile_production));
      request.fields['user_id'] = user.value.id.toString();
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      final response = await request.send();
      final responseData = jsonDecode(await response.stream.bytesToString());

      if (responseData['success']) {

        print(responseData['data']);
       

        // Dismiss loading dialog
        Get.back();

        
        return right(null);
      } else {
        // Handle upload failure
        // Show error message or dialog
        String errorMessage = responseData['error'] ?? 'Upload failed';
        Dialogs.showErrorDialog(context, errorMessage);
        return left('Upload failed');
      }
    } on SocketException catch (e) {
      // Handle network error
      Dialogs.showErrorDialog(context, e.message);
      return left('Network error: ${e.message}');
    } catch (e) {
      // Handle other exceptions
      Dialogs.showErrorDialog(context, e.toString());
      return left('Error: ${e.toString()}');
    } finally {
      // Dismiss loading dialog if it's still shown
      Get.back();
    }
  }


  EitherModel<String?> login(BuildContext context, Map<String, dynamic> formData) async {
  
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    Dialogs.showLoadingDialog(context); // Show loading dialog

    final response = await http.post(Uri.parse(Api.login_production), body: formData);
    final responseData = jsonDecode(response.body);
     
    if (responseData['success']) {
      if(responseData['data']['data']['student_id'] != null){
      user(User.fromMap(responseData['data'] as Map<String, dynamic>));
      await prefs.setString('user', user.toJson());
      print(user.toJson());
      Get.back();
      if (user.value.token!.isNotEmpty) {
        Get.offAll(() => HomeScreen(), transition: Transition.cupertino);
      }

      }else{
         Get.back();
          Dialogs.showErrorDialog(context, 'This account is not yet registered for access. Please register to proceed.');
      }

      return right(null);
    } else {
         Get.back();
    final dynamic errorData = responseData['error'];
final errorMessage = errorData != null ? errorData.toString() : 'Login failed';
Dialogs.showErrorDialog(context, errorMessage);
return left(errorMessage);
    }

  } on SocketException catch (e) {
    Get.back();
    Dialogs.showErrorDialog(context, 'Network error: ${e.message}');
    return left('Network error: ${e.message}');
  } catch (e) {
    Get.back();
    Dialogs.showErrorDialog(context, 'Error: ${e.toString()}');
    return left('Error: ${e.toString()}');
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
          Uri.parse(Api.logout_production),
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
  Future<void> logoutNotAuthorize() async {
    try {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? accessToken = prefs.getString('token');

      if (accessToken != null) {
        // Make API call to logout
        final response = await http.post(
          Uri.parse(Api.logout_production),
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

      var response = await http.post(Uri.parse(Api.register_production), body: data);
      var responseData = jsonDecode(response.body);

      if (responseData['success']) {
        user.value = User.fromMap(
            responseData['data'] as Map<String, dynamic>); // Update user value
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
