

import 'package:mobicom/env.dart';

class Api {


  static String login_local = "${Env.APP_URL_LOCAL}api/login";
  static String login = "${Env.APP_URL_PRODUCTION}api/login";
  static String logout = "${Env.APP_URL_PRODUCTION}api/logout";
  static String register = "${Env.APP_URL_PRODUCTION}api/register";
  static String sections = "${Env.APP_URL_PRODUCTION}api/sections";
  static String chapters = "${Env.APP_URL_PRODUCTION}api/chapters";
  static String chapter_lessons = "${Env.APP_URL_PRODUCTION}api/chapter/lessons";
  static String exercises = "${Env.APP_URL_PRODUCTION}api/exercises";
  static String take = "${Env.APP_URL_PRODUCTION}api/exercise/take";
  

  

}