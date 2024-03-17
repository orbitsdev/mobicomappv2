import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/features/exercises/exercise_details_screen.dart';
import 'package:mobicom/features/exercises/exercuse_list_item.dart';
import 'package:mobicom/models/exercise.dart';
import 'package:mobicom/widgets/full_screen.dart';
import 'package:shimmer/shimmer.dart';

class ExerciseScreen extends StatefulWidget {
  static String name ="exercise";
  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final ExerciseController exerciseController = Get.put(ExerciseController());

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  fetchExercises() async {
    await exerciseController.fetchExercises(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercises',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await fetchExercises();
        },
        child: Obx(
          () => exerciseController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: exerciseController.exercises.length,
                  itemBuilder: (context, index) {
                    Exercise exercise = exerciseController.exercises[index];
                    return ExerciseListItem(exercise: exercise);
                  },
                ),
        ),
      ),
    );
  }
}
