import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/features/exercises/answer_screen.dart';
import 'package:mobicom/features/exercises/question_page.dart';
import 'package:mobicom/features/exercises/result_screen.dart';
import 'package:mobicom/features/home_screen.dart';
import 'package:mobicom/features/results/whole_result_screen.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/Result.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/models/exercise_answer.dart';
import 'package:mobicom/models/fill_in_the_blank_question.dart';
import 'package:mobicom/models/multiple_choice_question.dart';
import 'package:mobicom/models/taked_exercise.dart';
import 'package:mobicom/models/true_or_false_question.dart';
import 'package:mobicom/models/whole_exercise.dart';
import 'package:mobicom/models/whole_result.dart';
import 'package:mobicom/services/api.dart';
import 'package:http/http.dart' as http;

class ExerciseController extends GetxController {
  var exercises = <Exercise>[].obs; // Change to non-nullable list
  var isLoading = false.obs;
  final authController = Get.find<AuthController>();

  var taked_exercise = TakedExercise().obs;
  var wholeExercise = WholeExercise().obs;
  EitherModel<String?> submitExerciseAnswers(
      BuildContext context, ExerciseSubmission exerciseSubmission) async {
    try {
      Dialogs.showLoadingDialog(context); // Show loading dialog
      // Convert ExerciseSubmission object to JSON string
      String exerciseSubmissionJson = jsonEncode(exerciseSubmission.toJson());

      // Send POST request with JSON body
      final http.Response response = await http.post(
        Uri.parse(Api.take_exercise),
        headers: {
          'Content-Type': 'application/json'
        }, // Add content type header
        body: exerciseSubmissionJson,
      );

      Navigator.pop(context); // Dismiss the loading dialog

      final responseData = jsonDecode(response.body);

      // Check response status code
      if (responseData['success']) {
        // Navigate to ResultScreen and remove all previous routes from the stack
        WholeResult result = WholeResult.fromMap(responseData['data']['data']);


        Get.offUntil(
          GetPageRoute(
            settings: RouteSettings(name: '/result'),
            page: () => WholeResultScreen(wholeresult: result),
          ),
          ModalRoute.withName(HomeScreen.name),
        );

        // Successful submission
        print('Exercise answers submitted successfully');
        return right('success');
      } else {
        // Failed submission, handle error
        String errorMessage =
            responseData['message'] ?? 'Unknown error occurred';
        Dialogs.showErrorDialog(context, errorMessage);
        return left(errorMessage);
      }
    } on SocketException catch (e) {
      Navigator.pop(context); // Dismiss the loading dialog
      Dialogs.showErrorDialog(context, 'Network error: ${e.message}');
      // Handle network errors
      return left('Network error: ${e.message}');
    } catch (error) {
      Navigator.pop(context); // Dismiss the loading dialog
      Dialogs.showErrorDialog(context, 'Error: $error');
      // Handle other exceptions
      return left('Error: $error');
    }
  }

  EitherModel<String?> fetchExerciseWithQuestion(
      BuildContext context, Exercise exercise) async {
    try {
      final response = await http.get(Uri.parse(
          Api.exercise_questions_production + '?exercise_id=${exercise.id}'));

      final responseData = jsonDecode(response.body);

      if (responseData['success']) {
        WholeExercise fetch_data =
            WholeExercise.fromMap(responseData['data']['data']);
        wholeExercise(fetch_data);
        return right('success');
      } else {
        // Handle error when the response is successful but 'success' is false
        return left('Error: ${responseData['message']}');
      }
    } on SocketException catch (e) {
      // Handle network error
      Dialogs.showErrorDialog(context, e.message);
      return left('Network error: ${e.message}');
    } catch (e) {
      // Handle other exceptions
      isLoading(false);
      Dialogs.showErrorDialog(context, e.toString());
      return left('Error: ${e.toString()}');
    }
  }

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
        Uri.parse(Api.take_production),
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

        Get.to(() => AnswerScreen(
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
      var response = await http.get(Uri.parse(Api.exercises_production));
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
