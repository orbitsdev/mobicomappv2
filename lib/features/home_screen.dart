import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/features/home/chapter_page.dart';
import 'package:mobicom/features/home/exercise_page.dart';
import 'package:mobicom/features/home/taked_exercise_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String name ="/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var authController = Get.find<AuthController>();

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ChapterPage(),
    ExercisePage(),
    TakedExercisePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xfff7d336),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Chapters'),
              onTap: () {
                // Navigate to chapters screen
                // You can replace '/chapters' with the route to your chapters screen
                // Get.toNamed('/chapters');
              },
            ),
            ListTile(
              title: Text('Exercises'),
              onTap: () {
                // Navigate to exercises screen
                // You can replace '/exercises' with the route to your exercises screen
                // Get.toNamed('/exercises');
              },
            ),
            ListTile(
              title: Text('Taken Exercises'),
              onTap: () {
                // Navigate to taken exercises screen
                // You can replace '/taken_exercises' with the route to your taken exercises screen
                // Get.toNamed('/taken_exercises');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.airplay),
            label: 'Chapters',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.package),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.hardDrive),
            label: 'Results',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xfff7d336),
        onTap: _onItemTapped,
      ),
    );
  }
}
