import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/result_controller.dart';
import 'package:mobicom/features/exercises/components/whole_result_card.dart';
import 'package:mobicom/models/whole_result.dart';

class TakedExercisePage extends StatefulWidget {
  const TakedExercisePage({Key? key}) : super(key: key);

  @override
  _TakedExercisePageState createState() => _TakedExercisePageState();
}

class _TakedExercisePageState extends State<TakedExercisePage> {
  final ResultController resultController = Get.put(ResultController());

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  fetchExercises() async {
    await resultController.getStudentExercises(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            await fetchExercises();
          },
          child: resultController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : _buildExerciseList(resultController.results),
        ),
      ),
    );
  }

  Widget _buildExerciseList(List<WholeResult> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        WholeResult wholeResult = results[index];
        return WholeResultCard(wholeResult: wholeResult);
      },
    );
  }
}
