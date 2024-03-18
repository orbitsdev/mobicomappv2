import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/features/exercises/exercise_details_screen.dart';
import 'package:mobicom/models/exercise.dart';

class ExerciseListItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseListItem({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ExerciseDetailsScreen(exercise: exercise)),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.grey[900], // Dark background color
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise.title ?? '',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, overflow: TextOverflow.ellipsis), // White text color
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Total Questions: ${exercise.total_questions ?? ''}',
                          style: TextStyle(fontSize: 16, color: Colors.grey[400]), // Light text color
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    exercise.type ?? '',
                    style: TextStyle(fontSize: 16, color: Colors.grey[400]), // Light text color
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
