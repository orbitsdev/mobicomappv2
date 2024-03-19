// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobicom/models/fill_in_the_blank_question_result.dart';
import 'package:mobicom/models/multiple_choice_question_result.dart';
import 'package:mobicom/models/true_or_false_question.dart';
import 'package:mobicom/models/true_or_false_question_result.dart';

class WholeResult {
  final int? id;
  final String? exercise_name;
  final String? exercise_type;
  final String? student_name;
  final int? total_questions;
  final int? total_score;
  final int? total_mistake;
  final String? created_at;
  final String? updated_at;
  List<Answer>?  answers;
  WholeResult({
    this.id,
    this.exercise_name,
    this.exercise_type,
    this.student_name,
    this.total_questions,
    this.total_score,
    this.total_mistake,
    this.created_at,
    this.updated_at,
  });

  

  WholeResult copyWith({
    int? id,
    String? exercise_name,
    String? exercise_type,
    String? student_name,
    int? total_questions,
    int? total_score,
    int? total_mistake,
    String? created_at,
    String? updated_at,
  }) {
    return WholeResult(
      id: id ?? this.id,
      exercise_name: exercise_name ?? this.exercise_name,
      exercise_type: exercise_type ?? this.exercise_type,
      student_name: student_name ?? this.student_name,
      total_questions: total_questions ?? this.total_questions,
      total_score: total_score ?? this.total_score,
      total_mistake: total_mistake ?? this.total_mistake,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'exercise_name': exercise_name,
      'exercise_type': exercise_type,
      'student_name': student_name,
      'total_questions': total_questions,
      'total_score': total_score,
      'total_mistake': total_mistake,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory WholeResult.fromMap(Map<String, dynamic> map) {
    return WholeResult(
      id: map['id'] != null ? map['id'] as int : null,
      exercise_name: map['exercise_name'] != null ? map['exercise_name'] as String : null,
      exercise_type: map['exercise_type'] != null ? map['exercise_type'] as String : null,
      student_name: map['student_name'] != null ? map['student_name'] as String : null,
      total_questions: map['total_questions'] != null ? map['total_questions'] as int : null,
      total_score: map['total_score'] != null ? map['total_score'] as int : null,
      total_mistake: map['total_mistake'] != null ? map['total_mistake'] as int : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WholeResult.fromJson(String source) => WholeResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WholeResult(id: $id, exercise_name: $exercise_name, exercise_type: $exercise_type, student_name: $student_name, total_questions: $total_questions, total_score: $total_score, total_mistake: $total_mistake, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant WholeResult other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.exercise_name == exercise_name &&
      other.exercise_type == exercise_type &&
      other.student_name == student_name &&
      other.total_questions == total_questions &&
      other.total_score == total_score &&
      other.total_mistake == total_mistake &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      exercise_name.hashCode ^
      exercise_type.hashCode ^
      student_name.hashCode ^
      total_questions.hashCode ^
      total_score.hashCode ^
      total_mistake.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}


class Answer {
   int? id;
   int? taked_exam_id;
   int? question_id;
   String? answer;
   MultipleChoiceQuestionResult? multiple_question_result;
   FillInTheBlankQuestionResult? fill_in_the_blank_result;
   TrueOrFalseQuestionResult? true_or_false_question_result;
  Answer({
    this.id,
    this.taked_exam_id,
    this.question_id,
    this.answer,
    this.multiple_question_result,
    this.fill_in_the_blank_result,
    this.true_or_false_question_result,
  });
  

  Answer copyWith({
    int? id,
    int? taked_exam_id,
    int? question_id,
    String? answer,
    MultipleChoiceQuestionResult? multiple_question_result,
    FillInTheBlankQuestionResult? fill_in_the_blank_result,
    TrueOrFalseQuestionResult? true_or_false_question_result,
  }) {
    return Answer(
      id: id ?? this.id,
      taked_exam_id: taked_exam_id ?? this.taked_exam_id,
      question_id: question_id ?? this.question_id,
      answer: answer ?? this.answer,
      multiple_question_result: multiple_question_result ?? this.multiple_question_result,
      fill_in_the_blank_result: fill_in_the_blank_result ?? this.fill_in_the_blank_result,
      true_or_false_question_result: true_or_false_question_result ?? this.true_or_false_question_result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'taked_exam_id': taked_exam_id,
      'question_id': question_id,
      'answer': answer,
      'multiple_question_result': multiple_question_result?.toMap(),
      'fill_in_the_blank_result': fill_in_the_blank_result?.toMap(),
      'true_or_false_question_result': true_or_false_question_result?.toMap(),
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
         

    return Answer(
      id: map['id'] != null ? map['id'] as int : null,
      taked_exam_id: map['taked_exam_id'] != null ? map['taked_exam_id'] as int : null,
      question_id: map['question_id'] != null ? map['question_id'] as int : null,
      answer: map['answer'] != null ? map['answer'] as String : null,
      multiple_question_result: map['multiple_question_result'] != null ? MultipleChoiceQuestionResult.fromMap(map['multiple_question_result'] as Map<String,dynamic>) : null,
      fill_in_the_blank_result: map['fill_in_the_blank_result'] != null ? FillInTheBlankQuestionResult.fromMap(map['fill_in_the_blank_result'] as Map<String,dynamic>) : null,
      true_or_false_question_result: map['true_or_false_question_result'] != null ? TrueOrFalseQuestionResult.fromMap(map['true_or_false_question_result'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Answer(id: $id, taked_exam_id: $taked_exam_id, question_id: $question_id, answer: $answer, multiple_question_reseult: $multiple_question_result, fill_in_the_blank_result: $fill_in_the_blank_result, true_or_false_question_result: $true_or_false_question_result)';
  }

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.taked_exam_id == taked_exam_id &&
      other.question_id == question_id &&
      other.answer == answer &&
      other.multiple_question_result == multiple_question_result &&
      other.fill_in_the_blank_result == fill_in_the_blank_result &&
      other.true_or_false_question_result == true_or_false_question_result;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      taked_exam_id.hashCode ^
      question_id.hashCode ^
      answer.hashCode ^
      multiple_question_result.hashCode ^
      fill_in_the_blank_result.hashCode ^
      true_or_false_question_result.hashCode;
  }
}
