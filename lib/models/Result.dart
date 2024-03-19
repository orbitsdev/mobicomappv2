// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Result {
  final int id;
  final String exercise_name;
  final String exercise_type;
  final String student_name;
  final int total_questions;
  final int total_score;
  final int total_mistake;
  
  final String created_at;
  final String updated_at;
  Result({
    required this.id,
    required this.exercise_name,
    required this.exercise_type,
    required this.student_name,
    required this.total_questions,
    required this.total_score,
    required this.total_mistake,
    required this.created_at,
    required this.updated_at,
  });
  

  Result copyWith({
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
    return Result(
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

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'] as int,
      exercise_name: map['exercise_name'] as String,
      exercise_type: map['exercise_type'] as String,
      student_name: map['student_name'] as String,
      total_questions: map['total_questions'] as int,
      total_score: map['total_score'] as int,
      total_mistake: map['total_mistake'] as int,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Result(id: $id, exercise_name: $exercise_name, exercise_type: $exercise_type, student_name: $student_name, total_questions: $total_questions, total_score: $total_score, total_mistake: $total_mistake, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Result other) {
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
