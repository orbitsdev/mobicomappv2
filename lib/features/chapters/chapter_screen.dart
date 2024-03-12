import 'package:flutter/material.dart';

class ChapterScreen extends StatelessWidget {
const ChapterScreen({ Key? key }) : super(key: key);
  static String name ="/chapters";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter Screen'),
      ),
      body: Container(),
    );
  }
}