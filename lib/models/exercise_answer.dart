class ExerciseAnswer {
  int question_id;
  String answer;
  

  ExerciseAnswer({
    required this.question_id,
    required this.answer,
  });

  Map<String, dynamic> toJson() {
    return {
      'question_id': question_id.toString(),
      'answer': answer,
    };
  }
}

class ExerciseSubmission {
  int exerciseId;
  int studentId;
  List<ExerciseAnswer> answers;

  ExerciseSubmission({
    required this.exerciseId,
    required this.studentId,
    required this.answers,
  });

  Map<String, dynamic> toJson() {
    return {
      'excercise_id': exerciseId.toString(),
      'student_id': studentId.toString(),
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
}

// Exam
