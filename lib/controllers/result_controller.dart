import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/fill_in_the_blank_question_result.dart';
import 'package:mobicom/models/multiple_choice_question_result.dart';
import 'package:mobicom/models/true_or_false_question_result.dart';
import 'package:mobicom/models/whole_result.dart';
import 'package:mobicom/services/api.dart'; // Import your Api class
// Import your Dialogs class
import 'dart:convert';

class ResultController extends GetxController {
  final authController = Get.find<AuthController>();
  var results = <WholeResult>[].obs;
  var isLoading = false.obs; // Add isLoading flag

  Future<void> getStudentExercises(BuildContext context) async {
    // Change return type to void
    isLoading.value = true; // Set isLoading to true when starting the API call
    try {
      var response = await http.get(Uri.parse(Api.student_exercises +
          '?student_id=${authController.user.value.student_id}'));
      var responseData = jsonDecode(response.body);

      if (responseData['success']) {
       
          List<dynamic> data = responseData['data'];
          // data.forEach((element) {
          //   print('__________||||||');

          //   List<dynamic> answers = element['answers'];
          //   answers.forEach((answer) {
             

          //     if (answer['exercise_type'] == "Multiple Choice") {
          //       MultipleChoiceQuestionResult m = MultipleChoiceQuestionResult.fromMap(answer['question'] as Map<String, dynamic>);
          //       print(m.toJson()); 
          //     } else if (answer['exercise_type'] == "True or False") {
          //       TrueOrFalseQuestionResult t= TrueOrFalseQuestionResult.fromMap(answer['question'] as Map<String, dynamic>);
          //       print(t.toJson()); 

          //     } else if (answer['exercise_type'] == "Fill in the Blank") {
          //       FillInTheBlankQuestionResult x = FillInTheBlankQuestionResult.fromMap(answer['question'] as Map<String, dynamic>);
          //       print(x.toJson()); 

          //     }
          //   });
          //   print('____________||||||||||');
          // });
          
      
       
       List<WholeResult> fetchedResults = data.map((item) => WholeResult.fromMap(item)).toList();
       results(fetchedResults);
        results.forEach((element) {
          print('_______');
          print(element);
          print('_______');
        });
        isLoading.value =
            false; // Set isLoading to false after successfully fetching data
      } else {
        Dialogs.showErrorDialog(context, 'Something went wrong');
        isLoading.value = false; // Set isLoading to false in case of error
      }
    } on SocketException catch (e) {
      Dialogs.showErrorDialog(context, 'No internet connection');
      isLoading.value =
          false; // Set isLoading to false in case of network error
    } catch (e) {
      Dialogs.showErrorDialog(context, e.toString());
      isLoading.value =
          false; // Set isLoading to false in case of any other error
    }
  }
}
