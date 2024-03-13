import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobicom/binding/app_controller_binding.dart';
import 'package:mobicom/constant/local_share_preferences.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/features/authentication/login_screen.dart';
import 'package:mobicom/features/authentication/register_screen.dart';
import 'package:mobicom/features/chapters/chapter_screen.dart';
import 'package:mobicom/features/exercises/exercises_screen.dart';
import 'package:mobicom/middleware/auth_middleware.dart';
import 'package:mobicom/middleware/not_login_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  AppControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var authcontroller = Get.find<AuthController>();
  @override
  void initState() {
      testStorage();
    super.initState();
  }

  void testStorage() async{

     final SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('action', 'Start');

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GATE APP',
      theme: ThemeData(useMaterial3: true),
       initialRoute: RegisterScreen.name,
      getPages: [
        GetPage(name: LoginScreen.name, page: ()=> LoginScreen(),
        middlewares: [
         NotLoginMiddleware(),
        ]
        ),
        GetPage(name: RegisterScreen.name, page: ()=>  RegisterScreen(),
        middlewares: [
           AuthMiddleware()
        ]
        ),
        GetPage(name: ExercisesScreen.name, page: ()=> ExercisesScreen(),
        middlewares: [
          AuthMiddleware()
        ]
        ),
        GetPage(name: ChapterScreen.name, page: ()=> ChapterScreen(),
        middlewares: [
          AuthMiddleware()
        ]
        ),
      ],
    );
  }
}