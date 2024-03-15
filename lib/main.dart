import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobicom/binding/app_controller_binding.dart';
import 'package:mobicom/constant/local_share_preferences.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/features/authentication/login_screen.dart';
import 'package:mobicom/features/authentication/register_screen.dart';
import 'package:mobicom/features/chapters/chapter_screen.dart';
import 'package:mobicom/features/chapters/lesson_screen.dart';
import 'package:mobicom/features/exercises/exercises_screen.dart';
import 'package:mobicom/features/home_screen.dart';
import 'package:mobicom/middleware/auth_middleware.dart';
import 'package:mobicom/middleware/not_login_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight
  ]);

  AppControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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

  void testStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('action', 'Start');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GATE APP',
      theme: ThemeData(useMaterial3: true),
     themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        // Customize the dark theme colors here
        scaffoldBackgroundColor: Colors.black45, // Very dark blue
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Darker blue
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black, // Darker blue
        ),
      ),
      initialRoute: HomeScreen.name,
      getPages: [
        GetPage(name: HomeScreen.name, page: () => HomeScreen(), middlewares: [
          //  NotLoginMiddleware(),
        ]),
        GetPage(
            name: LoginScreen.name,
            page: () => LoginScreen(),
            transition: Transition.cupertino,
            middlewares: [
              NotLoginMiddleware(),
            ]),
        GetPage(
            name: RegisterScreen.name,
            page: () => RegisterScreen(),
                        transition: Transition.cupertino,
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: ExercisesScreen.name,
            page: () => ExercisesScreen(),
                        transition: Transition.cupertino,
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: ChapterScreen.name,
            page: () => ChapterScreen(),
                        transition: Transition.cupertino,
            middlewares: [AuthMiddleware()
          ]
          ),
        GetPage(
            name: LessonScreen.name,
            page: () => LessonScreen(),
                        transition: Transition.cupertino,
            middlewares: [AuthMiddleware()
          ]
          ),
      ],
    );
  }
}
