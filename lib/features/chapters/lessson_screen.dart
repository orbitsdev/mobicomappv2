import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/models/chapter.dart';

class LesssonScreen extends StatelessWidget {
const LesssonScreen({ Key? key }) : super(key: key);
static String name ='/lessons';
  @override
  Widget build(BuildContext context){

    final chapter = Get.arguments['chapter']as Chapter;
    
    return Scaffold(
      appBar: AppBar(
        title:  Text('${chapter.title}'),
      ),
      body: Container(),
    );
  }
}