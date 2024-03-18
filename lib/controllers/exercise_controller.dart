import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/features/exercises/answer_screen.dart';
import 'package:mobicom/features/exercises/question_page.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/models/taked_exercise.dart';
import 'package:mobicom/services/api.dart';
import 'package:http/http.dart' as http;

class ExerciseController extends GetxController {
  var exercises = <Exercise>[].obs; // Change to non-nullable list
  var isLoading = false.obs;
  final authController = Get.find<AuthController>();

  var taked_exercise = TakedExercise().obs;
  EitherModel<String?> takeExercise(
      BuildContext context, String exerciseId) async {
    Get.back();
    try {
      Dialogs.showLoadingDialog(context); // Show loading dialog

      print(authController.user.value.token);
      Map<String, dynamic> formData = {
        'student_id': authController.user.value.student_id.toString(),
        'exercise_id': exerciseId, // Ensure exerciseId is a string
      };

      print(formData);
      final response = await http.post(
        Uri.parse(Api.take),
        headers: {
          'Authorization': 'Bearer ${authController.user.value.token}',
        },
        body: formData,
      );

      final responseData = jsonDecode(response.body);

      if (responseData['success']) {
        // print(responseData['data']);
        // Handle success scenario here
        Get.back();
        var taked = TakedExercise.fromMap(
            responseData['data']['data'] as Map<String, dynamic>);

        taked_exercise(taked);
        print(taked_exercise.toJson());

        Get.off(() => AnswerScreen(
              takedExercise: taked,
            )); // Dismiss loading dialog
        return right(null);
      } else {
        Get.back();
        // Handle failure scenario here
        String errorMessage =
            responseData['error'] ?? 'Failed to take exercise';
        Dialogs.showErrorDialog(context, errorMessage);
        return left('Failed to take exercise');
      }
    } on SocketException catch (e) {
      Get.back();
      Dialogs.showErrorDialog(context, e.message);
      return left('Network error: ${e.message}');
    } catch (e) {
      Get.back();
      Dialogs.showErrorDialog(context, e.toString());
      return left('Error: ${e.toString()}');
    }
  }

  EitherModel<String?> fetchExercises(BuildContext context) async {
    try {
      var response = await http.get(Uri.parse(Api.exercises));
      var responseData = jsonDecode(response.body);

      if (responseData['success']) {
        var data = responseData['data']['data']
            as List<dynamic>; // Extracting the chapters array from the response
        List<Exercise> new_data = (data
            .map((e) => Exercise.fromMap(e as Map<String, dynamic>))).toList();
        exercises(new_data);

        return right(
            'Data fetched successfully'); // Returning a success message
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
