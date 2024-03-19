// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/features/exercises/question_page.dart';
import 'package:mobicom/features/test_question_page.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/services/api.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseDetailsScreen({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {

    // var exercisecontroller = Get.find<ExerciseController>();
  return Scaffold(
    appBar: AppBar(
      title: Text(
        exercise.title ?? '',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MarkdownViewer(description: '${exercise.description}'),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.category, // You can change this to any relevant icon
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Type: ${exercise.type ?? ''}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.question_answer, // You can change this to any relevant icon
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Total Questions: ${exercise.total_questions ?? ''}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.to(() => QuestionPage(exercise: exercise,));
                // Get.to(() => TestQuestionPage());
                // _showStartExamDialog(context);
              },
              icon: Icon(Icons.play_arrow), // You can change this to any relevant icon
              label: Text('START'),
            ),
          ),
        ],
      ),
    ),
  );
}

  void _showStartExamDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Take Exercise'),
        content: Text('Are you sure you want to start the Exercise?'),
        actions: [
          TextButton(
            onPressed: () {
              // Ensure the exercise id is passed as a string
              // exercisecontroller.takeExercise(context, '${exercise.id}');
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
}
