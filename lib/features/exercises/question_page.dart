import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/features/exercises/components/fill_in_the_blank_question_widget.dart';
import 'package:mobicom/features/exercises/components/multiple_choice_question_widget.dart';
import 'package:mobicom/features/exercises/components/true_or_false_question_widget.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/models/exercise_answer.dart';
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
  late ExerciseController exerciseController;
  late AuthController authController;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    authController = Get.find<AuthController>();
    exerciseController = Get.find<ExerciseController>();
    fetchExercises();
  }

  fetchExercises() async {
    await exerciseController.fetchExerciseWithQuestion(context, widget.exercise);
  }

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
          return Stack(
            children: [
              FormBuilder(
                key: _formKey,
                child: ListView.builder(
                  itemCount:
                      exerciseController.wholeExercise.value.total_questions ??
                          0,
                  itemBuilder: (context, index) {
                    final question = getQuestionAtIndex(index);
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Question ${index + 1}:'),
                          getQuestionWidget(question, index),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 0,
                right: 0,
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () async {
                      // Validate the form
                      if (_formKey.currentState!.saveAndValidate()) {
                        Map<String, dynamic> formData =
                            _formKey.currentState!.value;

                 
                        ExerciseSubmission exerciseSubmission = convertFormDataToExerciseSubmission(formData);
                      await  exerciseController.submitExerciseAnswers(context, exerciseSubmission);

                        

                        // print(exerciseSubmission.toJson());

                  
                      } else {
                        // Form validation failed, display error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Please answer all questions.')),
                        );
                      }
                    },
                    child: Icon(Icons.check),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  dynamic getQuestionAtIndex(int index) {
    List<dynamic>? questions;

    switch (widget.exercise.type) {
      case 'Multiple Choice':
        questions =
            exerciseController.wholeExercise.value.multiple_choice_questions;
        break;
      case 'True or False':
        questions =
            exerciseController.wholeExercise.value.true_or_false_questions;
        break;
      case 'Fill in the Blank':
        questions =
            exerciseController.wholeExercise.value.fill_in_the_blank_questions;
        break;
    }

    if (questions != null && index < questions.length) {
      return questions[index];
    } else {
      return null;
    }
  }

  Widget getQuestionWidget(dynamic question, int index) {
    if (question is MultipleChoiceQuestion) {
      return MultipleChoiceQuestionWidget(
        question: question,
        index: question.id as int,
      );
    } else if (question is TrueOrFalseQuestion) {
      return TrueOrFalseQuestionWidget(
        question: question,
        index: question.id as int,
      );
    } else if (question is FillInTheBlankQuestion) {
      return FillInTheBlankQuestionWidget(
        question: question,
        index: question.id as int,
      );
    } else {
      return SizedBox(); // Return an empty widget or handle unknown question types
    }
  }

  ExerciseSubmission convertFormDataToExerciseSubmission(
    Map<String, dynamic> formData) {
  // Extract the exerciseId and studentId from the form data
  int exerciseId = widget.exercise.id as int;
  int studentId = authController.user.value.student_id as int;

  // Extract the answers from the form data and map them to ExerciseAnswer objects
  List<ExerciseAnswer> answers = [];
  
  formData.forEach((key, value) {
    // Assuming form fields are named as 'question_<questionId>'
    if (key.startsWith('question_')) {
      int questionId = int.parse(key.substring('question_'.length));
      ExerciseAnswer answer = ExerciseAnswer(
        question_id: questionId, // Use question ID instead of index
        answer: value.toString(),
      );
      answers.add(answer);
    }
  });

  // Create and return an ExerciseSubmission object
  return ExerciseSubmission(
    exerciseId: exerciseId,
    studentId: studentId,
    answers: answers,
  );
}

}
