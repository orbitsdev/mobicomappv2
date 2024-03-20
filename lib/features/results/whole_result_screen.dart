import 'package:flutter/material.dart';
import 'package:mobicom/models/whole_result.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';

class WholeResultScreen extends StatefulWidget {
  final WholeResult wholeresult;

  const WholeResultScreen({
    Key? key,
    required this.wholeresult,
  }) : super(key: key);

  @override
  _WholeResultScreenState createState() => _WholeResultScreenState();
}

class _WholeResultScreenState extends State<WholeResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          
            SizedBox(height: 20),
            _buildSectionTitle('Exercise Details'),
            _buildInfoRow('Exercise Name', '${widget.wholeresult.exercise_name}'),
            _buildInfoRow('Student Name', '${widget.wholeresult.student_name}'),
            _buildInfoRow('Total Score', widget.wholeresult.total_score.toString()),
            _buildInfoRow('Total Questions', widget.wholeresult.total_questions.toString()),
            _buildInfoRow('Date', '${widget.wholeresult.created_at}'),
              MarkdownViewer(description: '${widget.wholeresult.exercise_description}'),
            SizedBox(height: 20),
            _buildSectionTitle('Answers'),
            ...widget.wholeresult.answers!.map((answer) {
              return _buildAnswerCard(answer);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerCard(Answer answer) {
    String? actualQuestion;
    String? correctAnswer;
    List<String>? options;

    // Determine the actual question, correct answer, and options based on the type of exercise
    if (answer.exercise_type == "Multiple Choice") {
      actualQuestion = answer.multiple_question_result?.question;
      correctAnswer = answer.multiple_question_result?.correct_answer;
      options = answer.multiple_question_result?.options;
    } else if (answer.exercise_type == "True or False") {
      actualQuestion = answer.true_or_false_question_result?.question;
      correctAnswer = answer.true_or_false_question_result?.correct_answer;
    } else if (answer.exercise_type == "Fill in the Blank") {
      actualQuestion = answer.fill_in_the_blank_result?.question;
      correctAnswer = answer.fill_in_the_blank_result?.correct_answer;
    }

    // Determine if the answer is correct
    bool isCorrect = answer.answer!.toLowerCase() == correctAnswer!.toLowerCase();

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.withOpacity(0.3), Colors.blue.withOpacity(0.1)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                actualQuestion ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (options != null && options.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map((option) {
                    return Text(
                      option,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  }).toList(),
                ),
              SizedBox(height: 10),
              _buildAnswerRow('Your Answer:', answer.answer ?? "", isCorrect ? Colors.green : Colors.red),
              _buildAnswerRow('Actual Answer:', correctAnswer ?? "", Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerRow(String label, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
