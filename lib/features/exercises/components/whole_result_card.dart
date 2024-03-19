import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/features/exercises/answer_screen.dart';
import 'package:mobicom/features/results/whole_result_screen.dart';
import 'package:mobicom/models/whole_result.dart';

class WholeResultCard extends StatelessWidget {
  final WholeResult wholeResult;

  const WholeResultCard({Key? key, required this.wholeResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${wholeResult.exercise_name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline6?.color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Exercise Type: ${wholeResult.exercise_type}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total Questions & Score: ${wholeResult.total_questions} / ${wholeResult.total_score}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${wholeResult.created_at}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () { 
                 Get.to(()=> WholeResultScreen(wholeresult: wholeResult,));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
              ),
              child: Text(
                'View More Details',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
