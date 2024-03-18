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
import 'package:mobicom/models/fill_in_the_blank_question.dart';
import 'package:mobicom/models/multiple_choice_question.dart';
import 'package:mobicom/models/taked_exercise.dart';
import 'package:mobicom/models/true_or_false_question.dart';
import 'package:mobicom/models/whole_exercise.dart';
import 'package:mobicom/services/api.dart';
import 'package:http/http.dart' as http;

class ExerciseController extends GetxController {
  var exercises = <Exercise>[].obs; // Change to non-nullable list
  var isLoading = false.obs;
  final authController = Get.find<AuthController>();

  var taked_exercise = TakedExercise().obs;

  EitherModel<String?> fetchExerciseWithQuestion(Exercise exercise) async {
    try {
      final response = await http.get(Uri.parse(  Api.exercise_questions_production + '?exercise_id=${exercise.id}'));

      final responseData = jsonDecode(response.body);
      // print(responseData['success']);
      if (responseData['success']) {

     


          WholeExercise wholeexercise = WholeExercise.fromMap(responseData['data']['data']);
          print(wholeexercise.toJson());
        // MultipleChoiceQuestion multi = MultipleChoiceQuestion.fromMap(responseData['data']['data']['questions'][0]);
        //  print(multi.toJson());
        //  print(multi.correct_answer);


  // TrueOrFalseQuestion multi = TrueOrFalseQuestion.fromMap(responseData['data']['data']['questions'][0]);
  //        print(multi.toJson());
       


       

        // print(responseData['data']['data']['questions'][0]);

        // TrueOrFalseQuestion kk =  TrueOrFalseQuestion();
        // kk.id = responseData['data']['data']['questions'][0]['id'];
        // kk.question = responseData['data']['data']['questions'][0]['question'];
        // kk.correct_answer = responseData['data']['data']['questions'][0]['correct_answer'];

        // print(responseData['data']['data']['questions']['id']);
        
//        TrueOrFalseQuestion trues = TrueOrFalseQuestion.fromMap(responseData['data']['data']['questions'][0]);

// print('ID: ${trues.toJson()}');
// print('Question: ${trues.question}');
// print('Question Number: ${trues.question_number}');
// print('Correct Answer: ${trues.correct_answer}');

        // FillInTheBlankQuestion multi = FillInTheBlankQuestion.fromMap(responseData['data']['data']['questions'][0]);
        // var multi = TrueOrFalseQuestion.fromMap(
        //     responseData['data']['data']['questions'][0]);

        // print('ID: ${multi.id}');
        // print('Question: ${multi.question}');
        // print('Question Number: ${multi.question_number}');
        // print('Correct Answer: ${multi.correct_answer}');
      }

      return right('success');
    } on SocketException catch (e) {
      return left('Network error: ${e.message}');
    } catch (e) {
      //
      isLoading(false);
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
