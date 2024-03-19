import 'package:flutter/material.dart';
import 'package:mobicom/models/whole_result.dart';

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
  void initState() {


    super.initState();
    print(widget.wholeresult.answers);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Exercise Name: ${widget.wholeresult.exercise_name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Student Name: ${widget.wholeresult.student_name}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.wholeresult.answers?.length ?? 0,
              itemBuilder: (context, index) {
                final answer = widget.wholeresult.answers![index];
                final question = answer.answer;
                String? actualQuestion;

                // Determine the actual question based on the type of answer result
                if (answer.multiple_question_result != null) {
                  actualQuestion = answer.multiple_question_result!.question;
                } else if (answer.true_or_false_question_result != null) {
                  actualQuestion = answer.true_or_false_question_result!.question;
                } else if (answer.fill_in_the_blank_result != null) {
                  actualQuestion = answer.fill_in_the_blank_result!.question;
                }

                // Determine if the answer is correct
                bool isCorrect = answer.answer == question;

                return Card(
                  color: isCorrect ? Colors.green[100] : Colors.red[100],
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text('${actualQuestion ?? ""}'),
                    subtitle: Text('Answer: ${answer.answer}'),
                    trailing: Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
