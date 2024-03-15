// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Lesson {
    int? id;
    int? chapter_id;
    int? lesson_number_id;
    String? title;
    String? full_title;
    String? content;
    String? image_path;
    String? video_path;
    String? image_Type;
    String? video_Type;
    int? lesson_number;
    String? created_at;
    String? updated_at;
  Lesson({
    this.id,
    this.chapter_id,
    this.lesson_number_id,
    this.title,
    this.full_title,
    this.content,
    this.image_path,
    this.video_path,
    this.image_Type,
    this.video_Type,
    this.lesson_number,
    this.created_at,
    this.updated_at,
  });
  

  Lesson copyWith({
    int? id,
    int? chapter_id,
    int? lesson_number_id,
    String? title,
    String? full_title,
    String? content,
    String? image_path,
    String? video_path,
    String? image_Type,
    String? video_Type,
    int? lesson_number,
    String? created_at,
    String? updated_at,
  }) {
    return Lesson(
      id: id ?? this.id,
      chapter_id: chapter_id ?? this.chapter_id,
      lesson_number_id: lesson_number_id ?? this.lesson_number_id,
      title: title ?? this.title,
      full_title: full_title ?? this.full_title,
      content: content ?? this.content,
      image_path: image_path ?? this.image_path,
      video_path: video_path ?? this.video_path,
      image_Type: image_Type ?? this.image_Type,
      video_Type: video_Type ?? this.video_Type,
      lesson_number: lesson_number ?? this.lesson_number,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'chapter_id': chapter_id,
      'lesson_number_id': lesson_number_id,
      'title': title,
      'full_title': full_title,
      'content': content,
      'image_path': image_path,
      'video_path': video_path,
      'image_Type': image_Type,
      'video_Type': video_Type,
      'lesson_number': lesson_number,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'] != null ? map['id'] as int : null,
      chapter_id: map['chapter_id'] != null ? map['chapter_id'] as int : null,
      lesson_number_id: map['lesson_number_id'] != null ? map['lesson_number_id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      full_title: map['full_title'] != null ? map['full_title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      image_path: map['image_path'] != null ? map['image_path'] as String : null,
      video_path: map['video_path'] != null ? map['video_path'] as String : null,
      image_Type: map['image_Type'] != null ? map['image_Type'] as String : null,
      video_Type: map['video_Type'] != null ? map['video_Type'] as String : null,
      lesson_number: map['lesson_number'] != null ? map['lesson_number'] as int : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Lesson.fromJson(String source) => Lesson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Lesson(id: $id, chapter_id: $chapter_id, lesson_number_id: $lesson_number_id, title: $title, full_title: $full_title, content: $content, image_path: $image_path, video_path: $video_path, image_Type: $image_Type, video_Type: $video_Type, lesson_number: $lesson_number, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Lesson other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.chapter_id == chapter_id &&
      other.lesson_number_id == lesson_number_id &&
      other.title == title &&
      other.full_title == full_title &&
      other.content == content &&
      other.image_path == image_path &&
      other.video_path == video_path &&
      other.image_Type == image_Type &&
      other.video_Type == video_Type &&
      other.lesson_number == lesson_number &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      chapter_id.hashCode ^
      lesson_number_id.hashCode ^
      title.hashCode ^
      full_title.hashCode ^
      content.hashCode ^
      image_path.hashCode ^
      video_path.hashCode ^
      image_Type.hashCode ^
      video_Type.hashCode ^
      lesson_number.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}





