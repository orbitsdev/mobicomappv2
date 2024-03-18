import 'dart:convert';

import 'package:mobicom/models/fill_in_the_blank_question.dart';
import 'package:mobicom/models/multiple_choice_question.dart';
import 'package:mobicom/models/true_or_false_question.dart';

class WholeExercise {
  int? id;
  String? title;
  String? description;
  String? type;
  int? total_questions;
  String? created_at;
  String? updated_at;
  List<MultipleChoiceQuestion>? multiple_choice_questions;
  List<TrueOrFalseQuestion>? true_or_false_questions;
  List<FillInTheBlankQuestion>? fill_in_the_blank_questions;

  WholeExercise({
    this.id,
    this.title,
    this.description,
    this.type,
    this.total_questions,
    this.created_at,
    this.updated_at,
    this.multiple_choice_questions,
    this.true_or_false_questions,
    this.fill_in_the_blank_questions,
  });

  factory WholeExercise.fromMap(Map<String, dynamic> map) {
    List<MultipleChoiceQuestion> multipleChoiceQuestions = [];
    List<TrueOrFalseQuestion> trueOrFalseQuestions = [];
    List<FillInTheBlankQuestion> fillInTheBlankQuestions = [];

    switch (map['type']) {
      case 'Multiple Choice':
        if (map['questions'] != null) {
          multipleChoiceQuestions = List<MultipleChoiceQuestion>.from(
            map['questions'].map<MultipleChoiceQuestion>((x) => MultipleChoiceQuestion.fromMap(x)),
          );
        }
        break;
      case 'True or False':
        if (map['questions'] != null) {
          trueOrFalseQuestions = List<TrueOrFalseQuestion>.from(
            map['questions'].map<TrueOrFalseQuestion>((x) => TrueOrFalseQuestion.fromMap(x)),
          );
        }
        break;
      case 'Fill in the Blank':
        if (map['questions'] != null) {
          fillInTheBlankQuestions = List<FillInTheBlankQuestion>.from(
            map['questions'].map<FillInTheBlankQuestion>((x) => FillInTheBlankQuestion.fromMap(x)),
          );
        }
        break;
      // Add cases for other question types if needed
    }

    return WholeExercise(
      id: map['id'] as int?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      type: map['type'] as String?,
      total_questions: map['total_questions'] as int?,
      created_at: map['created_at'] as String?,
      updated_at: map['updated_at'] as String?,
      multiple_choice_questions: multipleChoiceQuestions,
      true_or_false_questions: trueOrFalseQuestions,
      fill_in_the_blank_questions: fillInTheBlankQuestions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'total_questions': total_questions,
      'created_at': created_at,
      'updated_at': updated_at,
      'multiple_choice_questions': multiple_choice_questions?.map((question) => question.toMap()).toList(),
      'true_or_false_questions': true_or_false_questions?.map((question) => question.toMap()).toList(),
      'fill_in_the_blank_questions': fill_in_the_blank_questions?.map((question) => question.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory WholeExercise.fromJson(String source) => WholeExercise.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WholeExercise(id: $id, title: $title, description: $description, type: $type, total_questions: $total_questions, created_at: $created_at, updated_at: $updated_at, multiple_choice_questions: $multiple_choice_questions, true_or_false_questions: $true_or_false_questions, fill_in_the_blank_questions: $fill_in_the_blank_questions)';
  }
}
