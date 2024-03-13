// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
 int? id;
 String? first_name;
 String? last_name;
 String? role;
 String? image;
 String? created_at;
 String? updated_at;
 String? token;

  User({
    this.id,
    this.first_name,
    this.last_name,
    this.role,
    this.image,
    this.created_at,
    this.updated_at,
    this.token,
  });
 

  User copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? role,
    String? image,
    String? created_at,
    String? updated_at,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      role: role ?? this.role,
      image: image ?? this.image,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'role': role,
      'image': image,
      'created_at': created_at,
      'updated_at': updated_at,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
      var user = map['data'];
      var token = map['token'];
    return User(
      id: user['id'] != null ? user['id'] as int : null,
      first_name:user['first_name'] != null ?user['first_name'] as String : null,
      last_name:user['last_name'] != null ?user['last_name'] as String : null,
      role:user['role'] != null ?user['role'] as String : null,
      image:user['image'] != null ?user['image'] as String : null,
      created_at:user['created_at'] != null ?user['created_at'] as String : null,
      updated_at:user['updated_at'] != null ?user['updated_at'] as String : null,
      token:token != null ?token as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, first_name: $first_name, last_name: $last_name, role: $role, image: $image, created_at: $created_at, updated_at: $updated_at, token: $token)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.role == role &&
      other.image == image &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      role.hashCode ^
      image.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      token.hashCode;
  }
}
