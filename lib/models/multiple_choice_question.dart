// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MultipleChoiceQuestion {
  int? id;
  String? question;
  int? questionNumber;
  String? correct_answer;
  List<String>? options;

  MultipleChoiceQuestion({
    this.id,
    this.question,
    this.questionNumber,
    this.correct_answer,
    this.options,
  });

  MultipleChoiceQuestion copyWith({
    int? id,
    String? question,
    int? questionNumber,
    String? correct_answer,
    List<String>? options,
  }) {
    return MultipleChoiceQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      questionNumber: questionNumber ?? this.questionNumber,
      correct_answer: correct_answer ?? this.correct_answer,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'questionNumber': questionNumber,
      'correct_answer': correct_answer,
      'options': options,
    };
  }

  factory MultipleChoiceQuestion.fromMap(Map<String, dynamic> map) {
    return MultipleChoiceQuestion(
      id: map['id'] as int?,
      question: map['question'] as String?,
      questionNumber: map['questionNumber'] as int?,
      correct_answer: map['correct_answer'] as String?,
      options: (map['options'] as List<dynamic>?)?.map((option) => option as String).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoiceQuestion.fromJson(String source) =>
      MultipleChoiceQuestion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MultipleChoiceQuestion(id: $id, question: $question, questionNumber: $questionNumber, correct_answer: $correct_answer, options: $options)';
  }

  @override
  bool operator ==(covariant MultipleChoiceQuestion other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.questionNumber == questionNumber &&
        other.correct_answer == correct_answer &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        questionNumber.hashCode ^
        correct_answer.hashCode ^
        options.hashCode;
  }
}
