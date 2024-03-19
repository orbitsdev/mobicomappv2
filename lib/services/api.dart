

import 'package:mobicom/env.dart';

class Api {


  static String login_local = "${Env.APP_URL_LOCAL}api/login";

  static String login_production = "${Env.APP_URL_PRODUCTION}api/login";
  static String logout_production = "${Env.APP_URL_PRODUCTION}api/logout";
  static String register_production = "${Env.APP_URL_PRODUCTION}api/register";
  static String sections_production = "${Env.APP_URL_PRODUCTION}api/sections";
  static String chapters_production = "${Env.APP_URL_PRODUCTION}api/chapters";
  static String chapter_lessons_production = "${Env.APP_URL_PRODUCTION}api/chapter/lessons";
  static String exercises_production = "${Env.APP_URL_PRODUCTION}api/exercises";
  static String take_production = "${Env.APP_URL_PRODUCTION}api/exercise/take";
  static String upload_profile_production = "${Env.APP_URL_PRODUCTION}api/upload-profile-image";
  static String exercise_questions_production = "${Env.APP_URL_PRODUCTION}api/exercise/questions";
  static String take_exercise = "${Env.APP_URL_PRODUCTION}api/take/exercise";
  static String student_exercises = "${Env.APP_URL_PRODUCTION}api/student-exercises";
  

  

}