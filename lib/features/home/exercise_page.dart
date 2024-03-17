import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/features/exercises/exercuse_list_item.dart';
import 'package:mobicom/models/exercise.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({ Key? key }) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {

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
    return RefreshIndicator(
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
      );
    
  }
}