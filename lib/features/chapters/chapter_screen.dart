import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/chapter_controller.dart';

class ChapterScreen extends StatefulWidget {
const ChapterScreen({ Key? key }) : super(key: key);
  static String name ="/chapters";

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
    var chaptercontroller = Get.find<ChapterController>();
  @override
  void initState() {

    chaptercontroller.fetchChapter(context);
    super.initState();
  }
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