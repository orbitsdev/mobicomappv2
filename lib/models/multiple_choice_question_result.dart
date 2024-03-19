// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MultipleChoiceQuestionResult {
  int? id;
  int? excercise_id;
  String? question;
  int? question_number;
  String? correct_answer;
  List<String>? options;
  MultipleChoiceQuestionResult({
    this.id,
    this.excercise_id,
    this.question,
    this.question_number,
    this.correct_answer,
    this.options,
  });

  MultipleChoiceQuestionResult copyWith({
    int? id,
    int? excercise_id,
    String? question,
    int? question_number,
    String? correct_answer,
    List<String>? options,
  }) {
    return MultipleChoiceQuestionResult(
      id: id ?? this.id,
      excercise_id: excercise_id ?? this.excercise_id,
      question: question ?? this.question,
      question_number: question_number ?? this.question_number,
      correct_answer: correct_answer ?? this.correct_answer,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'excercise_id': excercise_id,
      'question': question,
      'question_number': question_number,
      'correct_answer': correct_answer,
      'options': options,
    };
  }

  factory MultipleChoiceQuestionResult.fromMap(Map<String, dynamic> map) {
    return MultipleChoiceQuestionResult(
      id: map['id'] as int?,
      excercise_id: map['excercise_id'] as int?,
      question: map['question'] as String?,
      question_number: map['question_number'] as int?,
      correct_answer: map['correct_answer'] as String?,
      options: map['options'] != null ? List<String>.from(map['options'] as List<dynamic>) : null,
    );
  }


  String toJson() => json.encode(toMap());

  factory MultipleChoiceQuestionResult.fromJson(String source) => MultipleChoiceQuestionResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MultipleChoiceQuestionResult(id: $id, excercise_id: $excercise_id, question: $question, question_number: $question_number, correct_answer: $correct_answer, options: $options)';
  }

  @override
  bool operator ==(covariant MultipleChoiceQuestionResult other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.excercise_id == excercise_id &&
      other.question == question &&
      other.question_number == question_number &&
      other.correct_answer == correct_answer &&
      listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      excercise_id.hashCode ^
      question.hashCode ^
      question_number.hashCode ^
      correct_answer.hashCode ^
      options.hashCode;
  }
}
