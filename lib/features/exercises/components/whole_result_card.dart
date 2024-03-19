import 'package:flutter/material.dart';
import 'package:mobicom/models/whole_result.dart';

class WholeResultCard extends StatelessWidget {
  final WholeResult wholeResult;

  const WholeResultCard({Key? key, required this.wholeResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      color: Theme.of(context).cardColor, // Use theme's card color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wholeResult.exercise_name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline6?.color, // Use theme's headline color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Exercise Type: ${wholeResult.exercise_type}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color, // Use theme's body text color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Student Name: ${wholeResult.student_name}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color, // Use theme's body text color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total Questions: ${wholeResult.total_questions}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color, // Use theme's body text color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total Score: ${wholeResult.total_score}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color, // Use theme's body text color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total Mistake: ${wholeResult.total_mistake}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color, // Use theme's body text color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${wholeResult.created_at}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color, // Use theme's body text color
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the whole details page
              },
              style: ElevatedButton.styleFrom(
 // Use theme's accent color for button background
              ),
              child: Text(
                'View More Details',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Custom button text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
