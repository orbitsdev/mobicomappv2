// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Exercise {
  int? id;
  String? title;
  String? description;
  String? type;
  int? total_questions;
  String? created_at;
  String? updated_at;
  Exercise({
    this.id,
    this.title,
    this.description,
    this.type,
    this.total_questions,
    this.created_at,
    this.updated_at,
  });

  Exercise copyWith({
    int? id,
    String? title,
    String? description,
    String? type,
    int? total_questions,
    String? created_at,
    String? updated_at,
  }) {
    return Exercise(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      total_questions: total_questions ?? this.total_questions,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'total_questions': total_questions,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      total_questions: map['total_questions'] != null ? map['total_questions'] as int : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) => Exercise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exercise(id: $id, title: $title, description: $description, type: $type, total_questions: $total_questions, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Exercise other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.type == type &&
      other.total_questions == total_questions &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      type.hashCode ^
      total_questions.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
