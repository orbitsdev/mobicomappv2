import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/features/exercises/components/fill_in_the_blank_question_widget.dart';
import 'package:mobicom/features/exercises/components/multiple_choice_question_widget.dart';
import 'package:mobicom/features/exercises/components/true_or_false_question_widget.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/models/fill_in_the_blank_question.dart';
import 'package:mobicom/models/multiple_choice_question.dart';
import 'package:mobicom/models/true_or_false_question.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.title ?? ''),
      ),
      body: Obx(() {
        if (exerciseController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: exerciseController.wholeExercise.value.total_questions ?? 0,
            itemBuilder: (context, index) {
                // final question = getQuestionAtIndex(index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question ${index + 1}:'),
                  // getQuestionWidget(question),
                ],
              );
            },
          );
        }
      }),
    );
  }

  // Widget getQuestionWidget(dynamic question) {
  //   if (question is MultipleChoiceQuestion) {
  //     return MultipleChoiceQuestionWidget(questions: [question]);
  //   } else if (question is TrueOrFalseQuestion) {
  //     return TrueOrFalseQuestionWidget(questions: [question]);
  //   } else if (question is FillInTheBlankQuestion) {
  //     return FillInTheBlankQuestionWidget(questions: [question]);
  //   } else {
  //     return Container(); // Return an empty container as a fallback
  //   }
  // }

  // dynamic getQuestionAtIndex(int index) {
  //   if (exerciseController.wholeExercise.value.multipleChoiceQuestions != null &&
  //       index < exerciseController.wholeExercise.value.multipleChoiceQuestions!.length) {
  //     return exerciseController.wholeExercise.value.multipleChoiceQuestions![index];
  //   } else if (exerciseController.wholeExercise.value.trueOrFalseQuestions != null &&
  //       index < exerciseController.wholeExercise.value.trueOrFalseQuestions!.length) {
  //     return exerciseController.wholeExercise.value.trueOrFalseQuestions![index];
  //   } else if (exerciseController.wholeExercise.value.fillInTheBlankQuestions != null &&
  //       index < exerciseController.wholeExercise.value.fillInTheBlankQuestions!.length) {
  //     return exerciseController.wholeExercise.value.fillInTheBlankQuestions![index];
  //   } else {
  //     return null;
  //   }
  // }
}
