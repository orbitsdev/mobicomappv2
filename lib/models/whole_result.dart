// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobicom/models/fill_in_the_blank_question_result.dart';
import 'package:mobicom/models/multiple_choice_question_result.dart';
import 'package:mobicom/models/true_or_false_question.dart';
import 'package:mobicom/models/true_or_false_question_result.dart';

// class WholeResult {
//   int? id;
//   String? exercise_name;
//   String? exercise_type;
//   String? exercise_description;
//   String? student_name;
//   int? total_questions;
//   int? total_score;
//   int? total_mistake;
//   String? created_at;
//   String? updated_at;
//   List<Answer>? answers;

//   WholeResult({
//     this.id,
//     this.exercise_name,
//     this.exercise_type,
//     this.exercise_description,
//     this.student_name,
//     this.total_questions,
//     this.total_score,
//     this.total_mistake,
//     this.created_at,
//     this.updated_at,
//     this.answers,
//   });

//   WholeResult copyWith({
//     int? id,
//     String? exercise_name,
//     String? exercise_type,
//     String? exercise_description,
//     String? student_name,
//     int? total_questions,
//     int? total_score,
//     int? total_mistake,
//     String? created_at,
//     String? updated_at,
//     List<Answer>? answers,
//   }) {
//     return WholeResult(
//       id: id ?? this.id,
//       exercise_name: exercise_name ?? this.exercise_name,
//       exercise_type: exercise_type ?? this.exercise_type,
//       exercise_description: exercise_description ?? this.exercise_description,
//       student_name: student_name ?? this.student_name,
//       total_questions: total_questions ?? this.total_questions,
//       total_score: total_score ?? this.total_score,
//       total_mistake: total_mistake ?? this.total_mistake,
//       created_at: created_at ?? this.created_at,
//       updated_at: updated_at ?? this.updated_at,
//       answers: answers ?? this.answers,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'exercise_name': exercise_name,
//       'exercise_type': exercise_type,
//       'exercise_description': exercise_description,
//       'student_name': student_name,
//       'total_questions': total_questions,
//       'total_score': total_score,
//       'total_mistake': total_mistake,
//       'created_at': created_at,
//       'updated_at': updated_at,
//       'answers':
//           answers != null ? answers!.map((x) => x?.toMap()).toList() : null,
//     };
//   }

//   factory WholeResult.fromMap(Map<String, dynamic> map) {
//     return WholeResult(
//       id: map['id'] != null ? map['id'] as int : null,
//       exercise_name: map['exercise_name'] as String?,
//       exercise_type: map['exercise_type'] as String?,
//       exercise_description: map['exercise_description'] as String?,
//       student_name: map['student_name'] as String?,
//       total_questions: map['total_questions'] as int?,
//       total_score: map['total_score'] as int?,
//       total_mistake: map['total_mistake'] as int?,
//       created_at: map['created_at'] as String?,
//       updated_at: map['updated_at'] as String?,
//       answers: map['answers'] != null
//           ? List<Answer>.from((map['answers'] as List<dynamic>)
//               .map((x) => Answer.fromMap(x as Map<String, dynamic>)))
//           : null,
//     );
//   }
//   String toJson() => json.encode(toMap());

//   factory WholeResult.fromJson(String source) =>
//       WholeResult.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'WholeResult(id: $id, exercise_name: $exercise_name, exercise_type: $exercise_type, exercise_description: $exercise_description, student_name: $student_name, total_questions: $total_questions, total_score: $total_score, total_mistake: $total_mistake, created_at: $created_at, updated_at: $updated_at, answers: $answers)';
//   }

//   @override
//   bool operator ==(covariant WholeResult other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.exercise_name == exercise_name &&
//         other.exercise_type == exercise_type &&
//         other.exercise_description == exercise_description &&
//         other.student_name == student_name &&
//         other.total_questions == total_questions &&
//         other.total_score == total_score &&
//         other.total_mistake == total_mistake &&
//         other.created_at == created_at &&
//         other.updated_at == updated_at &&
//         listEquals(other.answers, answers);
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         exercise_name.hashCode ^
//         exercise_type.hashCode ^
//         exercise_description.hashCode ^
//         student_name.hashCode ^
//         total_questions.hashCode ^
//         total_score.hashCode ^
//         total_mistake.hashCode ^
//         created_at.hashCode ^
//         updated_at.hashCode ^
//         answers.hashCode;
//   }
// }

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:mobicom/models/fill_in_the_blank_question_result.dart';
import 'package:mobicom/models/multiple_choice_question_result.dart';
import 'package:mobicom/models/true_or_false_question.dart';
import 'package:mobicom/models/true_or_false_question_result.dart';

class WholeResult {
  int? id;
  String? exercise_name;
  String? exercise_type;
  String? exercise_description;
  String? student_name;
  int? total_questions;
  int? total_score;
  int? total_mistake;
  String? created_at;
  String? updated_at;
  Feed? feed; // Include Feed property
  List<Answer>? answers;

  WholeResult({
    this.id,
    this.exercise_name,
    this.exercise_type,
    this.exercise_description,
    this.student_name,
    this.total_questions,
    this.total_score,
    this.total_mistake,
    this.created_at,
    this.updated_at,
    this.feed, // Initialize Feed property
    this.answers,
  });

  WholeResult copyWith({
    int? id,
    String? exercise_name,
    String? exercise_type,
    String? exercise_description,
    String? student_name,
    int? total_questions,
    int? total_score,
    int? total_mistake,
    String? created_at,
    String? updated_at,
    Feed? feed,
    List<Answer>? answers,
  }) {
    return WholeResult(
      id: id ?? this.id,
      exercise_name: exercise_name ?? this.exercise_name,
      exercise_type: exercise_type ?? this.exercise_type,
      exercise_description: exercise_description ?? this.exercise_description,
      student_name: student_name ?? this.student_name,
      total_questions: total_questions ?? this.total_questions,
      total_score: total_score ?? this.total_score,
      total_mistake: total_mistake ?? this.total_mistake,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      feed: feed ?? this.feed,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'exercise_name': exercise_name,
      'exercise_type': exercise_type,
      'exercise_description': exercise_description,
      'student_name': student_name,
      'total_questions': total_questions,
      'total_score': total_score,
      'total_mistake': total_mistake,
      'created_at': created_at,
      'updated_at': updated_at,
      'feed': feed?.toMap(), // Convert Feed to map
      'answers': answers?.map((x) => x?.toMap()).toList(),
    };
  }

  factory WholeResult.fromMap(Map<String, dynamic> map) {
    return WholeResult(
      id: map['id'] != null ? map['id'] as int : null,
      exercise_name: map['exercise_name'] as String?,
      exercise_type: map['exercise_type'] as String?,
      exercise_description: map['exercise_description'] as String?,
      student_name: map['student_name'] as String?,
      total_questions: map['total_questions'] as int?,
      total_score: map['total_score'] as int?,
      total_mistake: map['total_mistake'] as int?,
      created_at: map['created_at'] as String?,
      updated_at: map['updated_at'] as String?,
      feed: map['feed'] != null ? Feed.fromMap(map['feed']) : null, // Initialize Feed from map
      answers: map['answers'] != null
          ? List<Answer>.from((map['answers'] as List<dynamic>)
              .map((x) => Answer.fromMap(x as Map<String, dynamic>)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WholeResult.fromJson(String source) =>
      WholeResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WholeResult(id: $id, exercise_name: $exercise_name, exercise_type: $exercise_type, exercise_description: $exercise_description, student_name: $student_name, total_questions: $total_questions, total_score: $total_score, total_mistake: $total_mistake, created_at: $created_at, updated_at: $updated_at,feed: $feed, answers: $answers)';
  }

  @override
  bool operator ==(covariant WholeResult other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.exercise_name == exercise_name &&
        other.exercise_type == exercise_type &&
        other.exercise_description == exercise_description &&
        other.student_name == student_name &&
        other.total_questions == total_questions &&
        other.total_score == total_score &&
        other.total_mistake == total_mistake &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.feed == feed &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        exercise_name.hashCode ^
        exercise_type.hashCode ^
        exercise_description.hashCode ^
        student_name.hashCode ^
        total_questions.hashCode ^
        total_score.hashCode ^
        total_mistake.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        feed.hashCode ^
        answers.hashCode;
  }
}
class Answer {
  String? exercise_type;
  int? id;
  int? taked_exam_id;
  int? question_id;
  int? question_number; // New property for question number
  String? answer;
  MultipleChoiceQuestionResult? multiple_question_result;
  FillInTheBlankQuestionResult? fill_in_the_blank_result;
  TrueOrFalseQuestionResult? true_or_false_question_result;

  Answer({
    this.exercise_type,
    this.id,
    this.taked_exam_id,
    this.question_id,
    this.question_number, // Include question_number in the constructor
    this.answer,
    this.multiple_question_result,
    this.fill_in_the_blank_result,
    this.true_or_false_question_result,
  });

  Answer copyWith({
    int? id,
    int? taked_exam_id,
    int? question_id,
    int? question_number,
    String? answer,
    String? exercise_type,
    MultipleChoiceQuestionResult? multiple_question_result,
    FillInTheBlankQuestionResult? fill_in_the_blank_result,
    TrueOrFalseQuestionResult? true_or_false_question_result,
  }) {
    return Answer(
      id: id ?? this.id,
      taked_exam_id: taked_exam_id ?? this.taked_exam_id,
      question_id: question_id ?? this.question_id,
      question_number: question_number ?? this.question_number,
      answer: answer ?? this.answer,
      exercise_type: exercise_type ?? this.exercise_type,
      multiple_question_result:
          multiple_question_result ?? this.multiple_question_result,
      fill_in_the_blank_result:
          fill_in_the_blank_result ?? this.fill_in_the_blank_result,
      true_or_false_question_result:
          true_or_false_question_result ?? this.true_or_false_question_result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'taked_exam_id': taked_exam_id,
      'question_id': question_id,
      'question_number': question_number, // Include question_number in toMap method
      'answer': answer,
      'exercise_type': exercise_type,
      'multiple_question_result': multiple_question_result?.toMap(),
      'fill_in_the_blank_result': fill_in_the_blank_result?.toMap(),
      'true_or_false_question_result': true_or_false_question_result?.toMap(),
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    dynamic question;
    if (map['exercise_type'] == "Multiple Choice") {
      question = MultipleChoiceQuestionResult.fromMap(
          map['question'] as Map<String, dynamic>);
    } else if (map['exercise_type'] == "True or False") {
      question = TrueOrFalseQuestionResult.fromMap(
          map['question'] as Map<String, dynamic>);
    } else if (map['exercise_type'] == "Fill in the Blank") {
      question = FillInTheBlankQuestionResult.fromMap(
          map['question'] as Map<String, dynamic>);
    }

    return Answer(
      id: map['id'] != null ? map['id'] as int : null,
      taked_exam_id:
          map['taked_exam_id'] != null ? map['taked_exam_id'] as int : null,
      question_id:
          map['question_id'] != null ? map['question_id'] as int : null,
      question_number:
          map['question_number'] != null ? map['question_number'] as int : null, // Parse question_number
      answer: map['answer'] as String?,
      exercise_type: map['exercise_type'] as String?,
      multiple_question_result: map['exercise_type'] == 'Multiple Choice'
          ? question as MultipleChoiceQuestionResult?
          : null,
      fill_in_the_blank_result: map['exercise_type'] == 'Fill in the Blank'
          ? question as FillInTheBlankQuestionResult?
          : null,
      true_or_false_question_result: map['exercise_type'] == 'True or False'
          ? question as TrueOrFalseQuestionResult?
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) =>
      Answer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Answer(id: $id, taked_exam_id: $taked_exam_id, question_id: $question_id, question_number: $question_number, answer: $answer, exercise_type: $exercise_type, multiple_question_result: $multiple_question_result, fill_in_the_blank_result: $fill_in_the_blank_result, true_or_false_question_result: $true_or_false_question_result)';
  }

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.taked_exam_id == taked_exam_id &&
        other.question_id == question_id &&
        other.question_number == question_number &&
        other.answer == answer &&
        other.exercise_type == exercise_type &&
        other.multiple_question_result == multiple_question_result &&
        other.fill_in_the_blank_result == fill_in_the_blank_result &&
        other.true_or_false_question_result == true_or_false_question_result;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        taked_exam_id.hashCode ^
        question_id.hashCode ^
        question_number.hashCode ^
        answer.hashCode ^
        exercise_type.hashCode ^
        multiple_question_result.hashCode ^
        fill_in_the_blank_result.hashCode ^
        true_or_false_question_result.hashCode;
  }
}


class Feed {
  
  int? id;
  int? taked_exam_id;
  int?  rate;
  String? message;
  int? is_read;
  Feed({
    this.id,
    this.taked_exam_id,
    this.rate,
    this.message,
    this.is_read,
  });


  Feed copyWith({
    int? id,
    int? taked_exam_id,
    int? rate,
    String? message,
    int? is_read,
  }) {
    return Feed(
      id: id ?? this.id,
      taked_exam_id: taked_exam_id ?? this.taked_exam_id,
      rate: rate ?? this.rate,
      message: message ?? this.message,
      is_read: is_read ?? this.is_read,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'taked_exam_id': taked_exam_id,
      'rate': rate,
      'message': message,
      'is_read': is_read,
    };
  }

  factory Feed.fromMap(Map<String, dynamic> map) {
    return Feed(
      id: map['id'] != null ? map['id'] as int : null,
      taked_exam_id: map['taked_exam_id'] != null ? map['taked_exam_id'] as int : null,
      rate: map['rate'] != null ? map['rate'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      is_read: map['is_read'] != null ? map['is_read'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feed.fromJson(String source) => Feed.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Feed(id: $id, taked_exam_id: $taked_exam_id, rate: $rate, message: $message, is_read: $is_read)';
  }

  @override
  bool operator ==(covariant Feed other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.taked_exam_id == taked_exam_id &&
      other.rate == rate &&
      other.message == message &&
      other.is_read == is_read;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      taked_exam_id.hashCode ^
      rate.hashCode ^
      message.hashCode ^
      is_read.hashCode;
  }
}
