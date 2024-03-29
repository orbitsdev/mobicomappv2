// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class TrueOrFalseQuestion {
 int? id;
  String? question;
  int? question_number;
  int? correct_answer;
  TrueOrFalseQuestion({
    this.id,
    this.question,
    this.question_number,
    this.correct_answer,
  });

  TrueOrFalseQuestion copyWith({
    int? id,
    String? question,
    int? question_number,
    int? correct_answer,
  }) {
    return TrueOrFalseQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      question_number: question_number ?? this.question_number,
      correct_answer: correct_answer ?? this.correct_answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'question_number': question_number,
      'correct_answer': correct_answer,
    };
  }

  factory TrueOrFalseQuestion.fromMap(Map<String, dynamic> map) {
    return TrueOrFalseQuestion(
      id: map['id'] != null ? map['id'] as int : null,
      question: map['question'] != null ? map['question'] as String : null,
      question_number: map['question_number'] != null ? map['question_number'] as int : null,
      correct_answer: map['correct_answer'] != null ? map['correct_answer'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrueOrFalseQuestion.fromJson(String source) => TrueOrFalseQuestion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TrueOrFalseQuestion(id: $id, question: $question, question_number: $question_number, correct_answer: $correct_answer)';
  }

  @override
  bool operator ==(covariant TrueOrFalseQuestion other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.question == question &&
      other.question_number == question_number &&
      other.correct_answer == correct_answer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      question.hashCode ^
      question_number.hashCode ^
      correct_answer.hashCode;
  }
}
