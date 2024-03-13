import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/binding/app_controller_binding.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/features/authentication/login_screen.dart';
import 'package:mobicom/features/authentication/register_screen.dart';
import 'package:mobicom/features/chapters/chapter_screen.dart';
import 'package:mobicom/features/exercises/exercises_screen.dart';
import 'package:mobicom/middleware/auth_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{ 

  AppControllerBinding().dependencies();
    final Future<SharedPreferences> local_storage = SharedPreferences.getInstance();
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
      authcontroller.test();

    super.initState();
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
        
        ]
        ),
        GetPage(name: RegisterScreen.name, page: ()=>  RegisterScreen(),
        middlewares: [
          // AuthMiddleware()
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