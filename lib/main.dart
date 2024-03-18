import 'dart:convert';

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
import 'package:mobicom/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  // Initialize the bindings
  AppControllerBinding().dependencies();

  // Check if the user is authenticated
final SharedPreferences prefs = await SharedPreferences.getInstance();
final userData = prefs.getString('user');

if (userData != null) {
  final userMap = jsonDecode(userData); 
  

  var authController = Get.find<AuthController>();
  var user = User.stringToModel(userMap); // Create a User object from the map
  authController.user(user); 
  
}


  final String initialRoute =userData != null ? HomeScreen.name : LoginScreen.name;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

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
      initialRoute: initialRoute,
      getPages: [
        GetPage(
          name: HomeScreen.name,
          page: () => HomeScreen(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: LoginScreen.name,
          page: () => LoginScreen(),
          transition: Transition.cupertino,
        ),
      ],
    );
  }
}