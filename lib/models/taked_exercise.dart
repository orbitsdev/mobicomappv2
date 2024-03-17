// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TakedExercise {
int? id;
int? student_id;
int? excercise_id;
  TakedExercise({
    this.id,
    this.student_id,
    this.excercise_id,
  });

  TakedExercise copyWith({
    int? id,
    int? student_id,
    int? excercise_id,
  }) {
    return TakedExercise(
      id: id ?? this.id,
      student_id: student_id ?? this.student_id,
      excercise_id: excercise_id ?? this.excercise_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'student_id': student_id,
      'excercise_id': excercise_id,
    };
  }

  factory TakedExercise.fromMap(Map<String, dynamic> map) {
    return TakedExercise(
      id: map['id'] != null ? map['id'] as int : null,
      student_id: map['student_id'] != null ? map['student_id'] as int : null,
      excercise_id: map['excercise_id'] != null ? map['excercise_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TakedExercise.fromJson(String source) => TakedExercise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TakedExercise(id: $id, student_id: $student_id, excercise_id: $excercise_id)';

  @override
  bool operator ==(covariant TakedExercise other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.student_id == student_id &&
      other.excercise_id == excercise_id;
  }

  @override
  int get hashCode => id.hashCode ^ student_id.hashCode ^ excercise_id.hashCode;
}
