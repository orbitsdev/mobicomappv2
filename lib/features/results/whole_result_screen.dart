import 'package:flutter/material.dart';

class WholeResultScreen extends StatefulWidget {
  const WholeResultScreen({Key? key}) : super(key: key);

  @override
  _WholeResultScreenState createState() => _WholeResultScreenState();
}

class _WholeResultScreenState extends State<WholeResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Score: 5', // Replace with dynamic data
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Total Questions: 10', // Replace with dynamic data
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Exercise Type: Multiple Choice', // Replace with dynamic data
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'Questions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with the actual number of questions
                itemBuilder: (context, index) {
                  bool isCorrectAnswer = index % 2 == 0; // Example: Alternate answers are considered correct
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${index + 1}:', // Replace with dynamic question
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Answer: ${isCorrectAnswer ? "Correct Answer" : "Incorrect Answer"}', // Replace with dynamic answer
                        style: TextStyle(
                          fontSize: 16,
                          color: isCorrectAnswer ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(height: 20, color: Colors.grey),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
