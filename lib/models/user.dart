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
  String? token;

  User({
    this.id,
    this.first_name,
    this.last_name,
    this.email,
    this.full_name,
    this.role,
    this.image,
    this.created_at,
    this.updated_at,
    this.token,
    this.student_id,
    this.section,
    this.teacher_full_name,
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
  String? token,
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
    token: token ?? this.token,
  );
}


  factory User.fromMap(Map<String, dynamic> map) {
    var user = map['data'];
    var token = map['token'];
    return User(
      id: user['id'] != null ? user['id'] as int : null,
      student_id: user['student_id'] != null ? user['student_id'] as int : null,
      section: user['section'] != null ? user['section'] as String : null,
      teacher_full_name: user['teacher_full_name'] != null ? user['teacher_full_name'] as String : null,
      first_name: user['first_name'] != null ? user['first_name'] as String : null,
      last_name: user['last_name'] != null ? user['last_name'] as String : null,
      email: user['email'] != null ? user['email'] as String : null,
      full_name: (user['first_name'] != null && user['last_name'] != null)
          ? '${user['first_name']} ${user['last_name']}'
          : null,
      role: user['role'] != null ? user['role'] as String : null,
      image: user['image'] != null ? user['image'] as String : null,
      created_at: user['created_at'] != null ? user['created_at'] as String : null,
      updated_at: user['updated_at'] != null ? user['updated_at'] as String : null,
      token: token != null ? token as String : null,
    );
  }

  factory User.stringToModel(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      student_id: map['student_id'] != null ? map['student_id'] as int : null,
      section: map['section'] != null ? map['section'] as String : null,
      teacher_full_name: map['teacher_full_name'] != null ? map['teacher_full_name'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'full_name': full_name,
      'role': role,
      'image': image,
      'created_at': created_at,
      'updated_at': updated_at,
      'token': token,
      'student_id': student_id,
      'section': section,
      'teacher_full_name': teacher_full_name,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, student_id: $student_id, section: $section, teacher_full_name: $teacher_full_name, first_name: $first_name, last_name: $last_name, email: $email, full_name: $full_name, role: $role, image: $image, created_at: $created_at, updated_at: $updated_at, token: $token)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
    return other.id == id &&
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
        other.updated_at == updated_at &&
        other.token == token;
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
        updated_at.hashCode ^
        token.hashCode;
  }
}
