

import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/controllers/chapter_controller.dart';
import 'package:mobicom/controllers/exercise_controller.dart';
import 'package:mobicom/controllers/result_controller.dart';
import 'package:mobicom/controllers/section_controller.dart';

class AppControllerBinding  implements Bindings{
  @override
  void dependencies() {

    Get.put(AuthController(),permanent: true);
    Get.put(SectionController(),permanent: true);
    Get.put(ChapterController(),permanent: true);
    Get.put(ExerciseController(),permanent: true);
    Get.put(ResultController(),permanent: true);
    // TODO: implement dependencies
  }

}