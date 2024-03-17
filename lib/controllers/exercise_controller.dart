

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/services/api.dart';
import 'package:http/http.dart' as http;

class ExerciseController extends GetxController {
      var exercises = <Exercise>[].obs; // Change to non-nullable list
       var isLoading = false.obs;


       
  EitherModel<String?> fetchExercises(BuildContext context) async {
    try {
      var response = await http.get(Uri.parse(Api.exercises));
      var responseData = jsonDecode(response.body);

      if (responseData['success']) {
        var data = responseData['data']['data'] as List<dynamic>; // Extracting the chapters array from the response
      List<Exercise> new_data = (data.map((e) => Exercise.fromMap(e as Map<String, dynamic>) )).toList();
      exercises(new_data);

     

        return right('Data fetched successfully'); // Returning a success message
      } else {
        Dialogs.showErrorDialog(context, 'Something went wrong');
        return left('Something went wrong'); // Returning an error message
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