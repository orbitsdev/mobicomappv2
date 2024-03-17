// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mobicom/models/taked_exercise.dart';

class AnswerScreen extends StatefulWidget {

  final TakedExercise takedExercise;
  const AnswerScreen({
    Key? key,
    required this.takedExercise,
  }) : super(key: key);
  
  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anser'),
      ),
      body: Column(
        children: [
          Text('${widget.takedExercise.id}'),
          Text('${widget.takedExercise.student_id}'),
          Text('${widget.takedExercise.excercise_id}'),
        ],
      ),
    );
  }
}