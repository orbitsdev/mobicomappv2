// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobicom/models/Result.dart';


class ResultScreen extends StatelessWidget {
  final Result result;

  const ResultScreen({Key? key, required this.result}) : super(key: key);

  static String name = "/result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                _buildDetailItem('Exercise Name', result.exercise_name),
                _buildDetailItem('Exercise Type', result.exercise_type),
                _buildDetailItem('Student Name', result.student_name),
                _buildDetailItem('Total Questions', result.total_questions.toString()),
                _buildDetailItem('Total Score', result.total_score.toString()),
                _buildDetailItem('Total Mistakes', result.total_mistake.toString()),
                _buildDetailItem('Date', result.created_at),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}