import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/constant/ui.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/services/api.dart';

class AuthController extends GetxController {
  var loginIsLoading = false.obs;

  void test() {
    print('test');
  }

  EitherModel<String?> register(BuildContext context, data) async {
  
   try {
    var response = await http.post(Uri.parse(Api.register), body: data);
    var responseData = jsonDecode(response.body);

    if (responseData['success']) {
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
        } else if (errors.containsKey('section_id')) {
          errorMessage = errors['enrolled_section_id'][0];
        } else {
          errorMessage = 'An error occurred';
        }
      } else {
        errorMessage = 'An error occurred';
      }

      Dialogs.showErrorDialog(context, errorMessage);
      return left(errorMessage);
    }
  } on SocketException catch (_) {
    Dialogs.showErrorDialog(context, 'No internet connection');
    return left('No internet connection');
  } catch (e) {
    Dialogs.showErrorDialog(context, 'An error occurred');
    return left('An error occurred');
  }
  }
}
