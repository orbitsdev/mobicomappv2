import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/features/home/chapter_page.dart';
import 'package:mobicom/features/home/exercise_page.dart';
import 'package:mobicom/features/home/taked_exercise_page.dart';
import 'package:mobicom/widgets/user_info.dart';

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

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(16),
              child:  UserInfoWidget(),),
            ListTile(
              leading: Icon(Icons.logout), // Use the logout icon
              title: Text('Logout'),
              onTap: () {
                // Call the logout method from the authController
                authController.logout(context);
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
