// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WholeResult {
  final int id;
  final String exercise_name;
  final String exercise_type;
  final String student_name;
  final int total_questions;
  final int total_score;
  final int total_mistake;
  final List<Question> questions_that_has_wrong_answers;
  final List<Question> questions_that_has_correct_answers;
  final String created_at;
  final String updated_at;

  WholeResult({
    required this.id,
    required this.exercise_name,
    required this.exercise_type,
    required this.student_name,
    required this.total_questions,
    required this.total_score,
    required this.total_mistake,
    required this.questions_that_has_wrong_answers,
    required this.questions_that_has_correct_answers,
    required this.created_at,
    required this.updated_at,
  });

  factory WholeResult.fromMap(Map<String, dynamic> map) {
    return WholeResult(
      id: map['id'],
      exercise_name: map['exercise_name'],
      exercise_type: map['exercise_type'],
      student_name: map['student_name'],
      total_questions: map['total_questions'],
      total_score: map['total_score'],
      total_mistake: map['total_mistake'],
      questions_that_has_wrong_answers: List<Question>.from(map['questions_that_has_wrong_answers'].map((x) => Question.fromMap(x))),
      questions_that_has_correct_answers: List<Question>.from(map['questions_that_has_correct_answers'].map((x) => Question.fromMap(x))),
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise_name': exercise_name,
      'exercise_type': exercise_type,
      'student_name': student_name,
      'total_questions': total_questions,
      'total_score': total_score,
      'total_mistake': total_mistake,
      'questions_that_has_wrong_answers': questions_that_has_wrong_answers.map((x) => x.toMap()).toList(),
      'questions_that_has_correct_answers': questions_that_has_correct_answers.map((x) => x.toMap()).toList(),
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}

class Question {
  final int id;
  final int excercise_id;
  final String question;
  final String? description;
  final int question_number_id;
  final String created_at;
  final String updated_at;

  Question({
    required this.id,
    required this.excercise_id,
    required this.question,
    this.description,
    required this.question_number_id,
    required this.created_at,
    required this.updated_at,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      excercise_id: map['excercise_id'],
      question: map['question'],
      description: map['description'],
      question_number_id: map['question_number_id'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'excercise_id': excercise_id,
      'question': question,
      'description': description,
      'question_number_id': question_number_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}