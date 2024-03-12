import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
const ExercisesScreen({ Key? key }) : super(key: key);
     static String name ="/exercisesscreen";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Screen'),
      ),
      body: Container(),
    );
  }
}