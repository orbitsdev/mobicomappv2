// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  int? student_id;
  String? section;
  String? teacher_full_name;
  String? first_name;
  String? last_name;
  String? email;
  String? full_name;
  String? role;
  String? image;
  String? created_at;
  String? updated_at;
  User({
    this.id,
    this.student_id,
    this.section,
    this.teacher_full_name,
    this.first_name,
    this.last_name,
    this.email,
    this.full_name,
    this.role,
    this.image,
    this.created_at,
    this.updated_at,
  });


  User copyWith({
    int? id,
    int? student_id,
    String? section,
    String? teacher_full_name,
    String? first_name,
    String? last_name,
    String? email,
    String? full_name,
    String? role,
    String? image,
    String? created_at,
    String? updated_at,
  }) {
    return User(
      id: id ?? this.id,
      student_id: student_id ?? this.student_id,
      section: section ?? this.section,
      teacher_full_name: teacher_full_name ?? this.teacher_full_name,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      full_name: full_name ?? this.full_name,
      role: role ?? this.role,
      image: image ?? this.image,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'student_id': student_id,
      'section': section,
      'teacher_full_name': teacher_full_name,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'full_name': full_name,
      'role': role,
      'image': image,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      student_id: map['student_id'] != null ? map['student_id'] as int : null,
      section: map['section'] != null ? map['section'] as String : null,
      teacher_full_name: map['teacher_full_name'] != null ? map['teacher_full_name'] as String : null,
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, student_id: $student_id, section: $section, teacher_full_name: $teacher_full_name, first_name: $first_name, last_name: $last_name, email: $email, full_name: $full_name, role: $role, image: $image, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.student_id == student_id &&
      other.section == section &&
      other.teacher_full_name == teacher_full_name &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email == email &&
      other.full_name == full_name &&
      other.role == role &&
      other.image == image &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      student_id.hashCode ^
      section.hashCode ^
      teacher_full_name.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      email.hashCode ^
      full_name.hashCode ^
      role.hashCode ^
      image.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
