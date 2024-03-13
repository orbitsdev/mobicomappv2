import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';


import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/features/exercises/exercises_screen.dart';
import 'package:mobicom/features/home_screen.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/services/api.dart';

import 'package:shared_preferences/shared_preferences.dart';
class AuthController extends GetxController {

  @override
  void onInit() { 

    print('test');
    super.onInit();
  }

  var loginIsLoading = false.obs;

  var user = User().obs;

  void test() {
    print('test');
  }

 EitherModel<String?> register(BuildContext context, data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    // Initialize SharedPreferences
 
    var response = await http.post(Uri.parse(Api.register), body: data);
    var responseData = jsonDecode(response.body);
   
    if (responseData['success']) {  
       user(User.fromMap(responseData['data'] as Map<String, dynamic>));
       print(user.toJson());
        await  prefs.setString('user', user.toJson());
        String? new_user = prefs.getString('user');
     

     if(user.value.first_name!.isNotEmpty){
        Get.offAll(()=> HomeScreen(), transition: Transition.cupertino);
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
