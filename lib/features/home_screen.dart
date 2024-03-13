

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 var authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(child: Text(' ${authcontroller.user.value.first_name}'),),
    );
    
  }
}