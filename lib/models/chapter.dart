// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobicom/models/lesson.dart';

class Chapter {
    int? id;
    String? title;
    String? description;
    String? image_path;
    String? created_at;
    String? updated_At;
    int? number;
    int? total_lessons;
    String? full_title;
    List<Lesson>? lessons;
  Chapter({
    this.id,
    this.title,
    this.description,
    this.image_path,
    this.created_at,
    this.updated_At,
    this.number,
    this.total_lessons,
    this.full_title,
    this.lessons,
  });


  Chapter copyWith({
    int? id,
    String? title,
    String? description,
    String? image_path,
    String? created_at,
    String? updated_At,
    int? number,
    int? total_lessons,
    String? full_title,
    List<Lesson>? lessons,
  }) {
    return Chapter(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image_path: image_path ?? this.image_path,
      created_at: created_at ?? this.created_at,
      updated_At: updated_At ?? this.updated_At,
      number: number ?? this.number,
      total_lessons: total_lessons ?? this.total_lessons,
      full_title: full_title ?? this.full_title,
      lessons: lessons ?? this.lessons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image_path': image_path,
      'created_at': created_at,
      'updated_At': updated_At,
      'number': number,
      'total_lessons': total_lessons,
      'full_title': full_title,
      'lessons': lessons?.map((x) => x.toMap()).toList(),
    };
  }
factory Chapter.fromMap(Map<String, dynamic> map) {
  return Chapter(
    id: map['id'] != null ? map['id'] as int : null,
    title: map['title'] != null ? map['title'] as String : null,
    description: map['description'] != null ? map['description'] as String : null,
    image_path: map['image_path'] != null ? map['image_path'] as String : null,
    created_at: map['created_at'] != null ? map['created_at'] as String : null,
    updated_At: map['updated_At'] != null ? map['updated_At'] as String : null,
    number: map['number'] != null ? map['number'] as int : null,
    total_lessons: map['total_lessons'] != null ? map['total_lessons'] as int : null,
    full_title: map['full_title'] != null ? map['full_title'] as String : null,
    lessons: map['lessons'] != null ? List<Lesson>.from(map['lessons'].map((lesson) => Lesson.fromMap(lesson as Map<String, dynamic>))) : null,
  );
}
  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) => Chapter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chapter(id: $id, title: $title, description: $description, image_path: $image_path, created_at: $created_at, updated_At: $updated_At, number: $number, total_lessons: $total_lessons, full_title: $full_title, lessons: $lessons)';
  }

  @override
  bool operator ==(covariant Chapter other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.image_path == image_path &&
      other.created_at == created_at &&
      other.updated_At == updated_At &&
      other.number == number &&
      other.total_lessons == total_lessons &&
      other.full_title == full_title &&
      listEquals(other.lessons, lessons);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image_path.hashCode ^
      created_at.hashCode ^
      updated_At.hashCode ^
      number.hashCode ^
      total_lessons.hashCode ^
      full_title.hashCode ^
      lessons.hashCode;
  }
}
