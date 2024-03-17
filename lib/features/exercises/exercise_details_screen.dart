import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/services/api.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';
import 'package:http/http.dart' as http;

class ExerciseDetailsScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailsScreen({Key? key, required this.exercise})
      : super(key: key);

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.exercise.title ?? '',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MarkdownViewer(description: '${widget.exercise.description}'),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.category, // You can change this to any relevant icon
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'Type: ${widget.exercise.type ?? ''}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons
                      .question_answer, // You can change this to any relevant icon
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'Total Questions: ${widget.exercise.total_questions ?? ''}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _showStartExamDialog(context);
              },
              icon: Icon(
                  Icons.play_arrow), // You can change this to any relevant icon
              label: Text('Take Exercise'),
            ),
          ],
        ),
      ),
    );
  }

  void _showStartExamDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Take Exercise'),
          content: Text('Are you sure you want to start the Exercise?'),
          actions: [
            TextButton(
              onPressed: () {
                // Call takeExercise when the user clicks Yes
                // takeExercise(widget.exercise.id!);
                Get.back();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
