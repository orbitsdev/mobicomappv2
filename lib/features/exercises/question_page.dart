import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http; // Import http package
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/models/exercise.dart';

class QuestionPage extends StatefulWidget {
  final Exercise exercise;
  const QuestionPage({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var exerciseController = Get.find<ExerciseController>();

  @override
  void initState() {
    super.initState();

    fetchExerciseQuestion();
  }

   fetchExerciseQuestion() async {
     await exerciseController.fetchExerciseWithQuestion( widget.exercise);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body:Obx(() {
        if (exerciseController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // Handle data when loaded
          return Container(); // Placeholder for your UI
        }
      }),
    );
  }
}
